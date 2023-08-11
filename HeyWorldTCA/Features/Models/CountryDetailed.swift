struct CountryDetailed: CountryProtocol {
    let code: String
    let name: String
    let native: String
    let phone: String
    let continent: Continent
    let capital: String?
    let currency: String?
    let languages: [Language]
    let flag: String
    
    init(
        code: String,
        name: String,
        native: String,
        phone: String,
        continent: Continent,
        capital: String?,
        currency: String?,
        languages: [Language],
        flag: String
    ) {
        self.code = code
        self.name = name
        self.native = native
        self.phone = phone
        self.continent = continent
        self.capital = capital
        self.currency = currency
        self.languages = languages
        self.flag = flag
    }
    
    init(_ graphQLData: SchemaGraphQL.GetCountryDetailQuery.Data.Country) {
        self.code = graphQLData.code
        self.name = graphQLData.name
        self.native = graphQLData.native
        self.phone = graphQLData.phone
        self.continent = Continent(graphQLData.continent)
        self.capital = graphQLData.capital
        self.currency = graphQLData.currency
        self.languages = Language.toArray(graphQLData.languages)
        self.flag = graphQLData.emoji
    }
    
    init(from countryLight: CountryLight) {
        self.code = countryLight.code
        self.name = countryLight.name
        self.flag = countryLight.flag
        self.phone = ""
        self.native = ""
        self.languages = []
        self.continent = Continent(code: "", name: "")
        self.capital = nil
        self.currency = nil
    }
}

extension CountryDetailed {
    static let mokedElement = CountryDetailed(
        code: "JP",
        name: "Japan",
        native: "日本",
        phone: "81",
        continent: Continent(code: "AS", name: "Asia"),
        capital: "Tokyo",
        currency: "JPY",
        languages: [Language(code: "ja", name: "Japanese", native: "日本語"), Language(code: "en", name: "English", native: "English")],
        flag: "🇯🇵"
    )
    
    static let empty = CountryDetailed(
        code: "",
        name: "",
        native: "",
        phone: "",
        continent: Continent(code: "", name: ""),
        capital: nil,
        currency: nil,
        languages: [],
        flag: ""
    )
}
