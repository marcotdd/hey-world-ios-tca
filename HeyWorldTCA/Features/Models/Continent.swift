import Foundation

struct Continent: Equatable {
    let id: String = UUID().uuidString
    let code: String
    let name: String
    
    init(code: String, name: String) {
        self.code = code
        self.name = name
    }
    
    init(_ graphQLData: SchemaGraphQL.GetCountryDetailQuery.Data.Country.Continent) {
        code = graphQLData.code
        name = graphQLData.name
    }
}
