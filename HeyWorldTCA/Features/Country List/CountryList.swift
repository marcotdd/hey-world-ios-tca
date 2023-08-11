import Foundation
import ComposableArchitecture

struct CountryList: Reducer {
    @Dependency(\.apiClient) var apiClient
    
    struct State: Equatable, Identifiable {
        var id: String = UUID().uuidString
        var viewState: ViewState = .initial
        var countries: [CountryLight] = []
        var countryDetailState = CountryDetail.State()
        
        @BindingState var isCountryDetailPresented: Bool = false
        @BindingState var toggleIsOn = false
    }
    
    enum Action: BindableAction, Equatable {
        case appear
        case binding(BindingAction<State>)
        case fetchCountries
        case countriesResponse(TaskResult<[CountryLight]>)
        case refresh
        case openCountryDetail(country: CountryLight)
        case countryDetail(CountryDetail.Action)
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()
        Scope(state: \.countryDetailState, action: /Action.countryDetail) {
            CountryDetail()
        }
        Reduce { state, action in
            switch action {
            case .appear:
                state.viewState = .loading
                return .send(.fetchCountries)
                
            case .fetchCountries:
                return .run { send in
                    await send(.countriesResponse(TaskResult { try await apiClient.fetchCountries() ?? [] }))
                }
                
            case .refresh:
                return .send(.fetchCountries)
                
            case .countriesResponse(.success(let countries)):
                state.viewState = .success
                state.countries = countries
                return .none
                
            case .countriesResponse(.failure(let error)):
                if let error = error as? HeyWorldError {
                    state.viewState = .failure(error)
                } else {
                    state.viewState = .failure(HeyWorldError.unknownError)
                }
                return .none
                
            case .openCountryDetail(let countryLight):
                state.countryDetailState = CountryDetail.State()
                state.countryDetailState.country = CountryDetailed(from: countryLight)
                state.isCountryDetailPresented = true
                return .none
                
            case .countryDetail:
                return .none
                
            case .binding:
                return .none
            }
        }
    }
}

private enum APIClientKey: DependencyKey {
    static let liveValue = APIClient.live
}

extension DependencyValues {
    var apiClient: APIClient {
        get { self[APIClientKey.self] }
        set { self[APIClientKey.self] = newValue }
    }
}
