import SwiftUI
import ComposableArchitecture

struct CountryDetailView: View {
    let store: StoreOf<CountryDetail>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            Group {
                switch viewStore.state.viewState {
                case .initial:
                    Color.clear.onAppear {
                        viewStore.send(.appear)
                    }
                    
                case .loading:
                    ProgressView()
                    
                case .failure(let error):
                    ErrorView(error: error)
                    
                case .success:
                    countryDetailView
                }
            }
            .navigationTitle(viewStore.country.name)
        }
    }
    
    private var countryDetailView: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text(viewStore.country.flag)
                        Text(viewStore.country.native)
                    }
                    .font(.title)
                    .padding(.vertical, 4)

                    CountryDetailElementView(label: "Code", value: viewStore.country.code)

                    if let capital = viewStore.state.country.capital {
                        CountryDetailElementView(label: "Capital", value: capital)
                    }

                    CountryDetailElementView(label: "Continent", value: viewStore.state.country.continent.name)
                    CountryDetailElementView(label: "Telephone Prefix", value: viewStore.state.country.phone)

                    if let currency = viewStore.state.country.currency {
                        CountryDetailElementView(label: "Currency", value: currency)
                    }

                    if let languages = viewStore.state.formattedLanguages {
                        CountryDetailElementView(label: "Languages", value: languages)
                    }
                }
                .padding(.horizontal)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
            }
        }
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(store: Store(initialState: CountryDetail.State()) { CountryDetail()._printChanges() } )
    }
}
