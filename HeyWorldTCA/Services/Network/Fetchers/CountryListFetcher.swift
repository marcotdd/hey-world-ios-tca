import Foundation

protocol CountryListFetcherProtocol {
    func fetch() async throws -> [CountryLight]?
}

class CountryListFetcher: Fetcher<SchemaGraphQL.GetCountriesQuery, [CountryLight]>, CountryListFetcherProtocol {
    init() {
        super.init(query: SchemaGraphQL.GetCountriesQuery()) { data in
            CountryLight.toArray(data.countries)
        }
    }
}
