import Foundation

struct CountryLight: CountryProtocol, Identifiable, Equatable {
    let id: String = UUID().uuidString
    let code: String
    let flag: String
    let name: String
}

extension CountryLight {
    static func toArray(_ graphQLData: [SchemaGraphQL.GetCountriesQuery.Data.Country]) -> [CountryLight] {
        graphQLData.compactMap { CountryLight(code: $0.code, flag: $0.emoji, name: $0.name) }
    }
}

extension CountryLight {
    static let mokedList: [CountryLight] = [
        CountryLight(code: "ES", flag: "🇪🇸", name: "Spain"),
        CountryLight(code: "IT", flag: "🇮🇹", name: "Italy"),
        CountryLight(code: "JP", flag: "🇯🇵", name: "Japan"),
        CountryLight(code: "TN", flag: "🇹🇳", name: "Tunisia")
    ]
    
    static let mokedElement: CountryLight = CountryLight(code: "ES", flag: "🇪🇸", name: "Spain")
}
