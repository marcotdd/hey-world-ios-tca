import Foundation
import ComposableArchitecture

struct APIClient {
    var fetchCountries: () async throws -> [CountryLight]?
    var fetchCountry: (String) async throws -> CountryDetailed?
}

extension APIClient {
    static let live = Self(
        fetchCountries: GraphQLAPI.fetchCountries,
        fetchCountry: GraphQLAPI.fetchCountry
    )
}

extension APIClient: TestDependencyKey {
    static let testValue = Self(
        fetchCountries: {
            CountryLight.mokedList
        },
        fetchCountry: { _ in 
            CountryDetailed.mokedElement
        }
    )
}

struct GraphQLAPI {
    static func fetchCountries() async throws -> [CountryLight]? {
        let fetcher = CountryListFetcher()
        return try await fetcher.fetch()
    }
    
    static func fetchCountry(code: String) async throws -> CountryDetailed? {
        let fetcher = CountryDetailFetcher(code: code)
        return try await fetcher.fetch()
    }
}
