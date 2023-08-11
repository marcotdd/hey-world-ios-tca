import Foundation
import ComposableArchitecture

struct CountryDetail: Reducer {
    @Dependency(\.apiClient) var apiClient
    
    struct State: Equatable, Identifiable {
        var id: String = UUID().uuidString
        var viewState: ViewState = .initial
        var country: CountryDetailed = .empty
        
        // MARK: - Computed Properties
        
        /// It provides a formatted list of languages with the native version (e.g. Italian (Italian), English (English))
        var formattedLanguages: String? {
            guard !country.languages.isEmpty else { return "-" }
            
            return country.languages.compactMap {
                guard let name = $0.name, let native = $0.native else { return nil }
                return "\(name) (\(native))"
            }.joined(separator: ", ")
        }
    }
    
    enum Action {
        case appear
        case fetchCountry
        case countryResponse(TaskResult<CountryDetailed?>)
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .appear:
            state.viewState = .loading
            return .send(.fetchCountry)
            
        case .fetchCountry:
            let code = state.country.code
            
            return .run { send in
                await send(.countryResponse(TaskResult { try await apiClient.fetchCountry(code) }))
            }
            
        case .countryResponse(let result):
            switch result {
            case .success(let country):
                if let country = country {
                    state.country = country
                    state.viewState = .success
                } else {
                    state.viewState = .failure(HeyWorldError.emptyDataError)
                }
                
            case .failure(let error):
                if let error = error as? HeyWorldError {
                    state.viewState = .failure(error)
                } else {
                    state.viewState = .failure(HeyWorldError.unknownError)
                }
                return .none
            }
            return .none
        }
    }
}
