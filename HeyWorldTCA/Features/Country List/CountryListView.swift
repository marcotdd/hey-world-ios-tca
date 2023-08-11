import ComposableArchitecture
import SwiftUI

struct CountryListView: View {
    let store: StoreOf<CountryList>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack {
                Group {
                    switch viewStore.viewState {
                    case .initial:
                        Color.clear.onAppear {
                            viewStore.send(.appear)
                        }
                        
                    case .loading:
                        ProgressView()
                        
                    case .failure(let error):
                        ErrorView(error: error)
                            .refreshable {
                                await viewStore.send(.refresh).finish()
                            }
                        
                    case .success:
                        if !viewStore.state.countries.isEmpty {
                            VStack {
                                List(viewStore.countries) { country in
                                    Button {
                                        viewStore.send(.openCountryDetail(country: country))
                                    } label: {
                                        CountryListRowView(country: country)
                                    }
                                }
                                .listStyle(.plain)
                            }
                            .navigationDestination(isPresented: viewStore.$isCountryDetailPresented) {
                                CountryDetailView(store: store.scope(
                                    state: \.countryDetailState,
                                    action: CountryList.Action.countryDetail
                                ))
                            }
                            .refreshable {
                                await viewStore.send(.refresh).finish()
                            }

                        } else {
                            EmptyView {
                                Text("No countries available")
                            }.refreshable {
                                await viewStore.send(.refresh).finish()
                            }
                        }
                    }
                }
                .navigationTitle("World Countries")
            }
        }
    }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView(
            store: Store(initialState: CountryList.State()) {
                CountryList()._printChanges()
            }
        )
    }
}
