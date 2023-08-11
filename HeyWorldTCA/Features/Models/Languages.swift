import Foundation

struct Language: Equatable {
    let id: String = UUID().uuidString
    let code: String
    let name: String?
    let native: String?
}

extension Language {
    static func toArray(_ graphQLData: [SchemaGraphQL.GetCountryDetailQuery.Data.Country.Language]) -> [Language] {
        graphQLData.compactMap { Language(code: $0.code, name: $0.name, native: $0.native) }
    }
}
