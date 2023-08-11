// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension SchemaGraphQL {
  class GetCountryDetailQuery: GraphQLQuery {
    static let operationName: String = "GetCountryDetail"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetCountryDetail($code: ID!) { country(code: $code) { __typename code name native phone continent { __typename code name } capital currency languages { __typename code name native } emoji } }"#
      ))

    public var code: ID

    public init(code: ID) {
      self.code = code
    }

    public var __variables: Variables? { ["code": code] }

    struct Data: SchemaGraphQL.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { SchemaGraphQL.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("country", Country?.self, arguments: ["code": .variable("code")]),
      ] }

      var country: Country? { __data["country"] }

      /// Country
      ///
      /// Parent Type: `Country`
      struct Country: SchemaGraphQL.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { SchemaGraphQL.Objects.Country }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("code", SchemaGraphQL.ID.self),
          .field("name", String.self),
          .field("native", String.self),
          .field("phone", String.self),
          .field("continent", Continent.self),
          .field("capital", String?.self),
          .field("currency", String?.self),
          .field("languages", [Language].self),
          .field("emoji", String.self),
        ] }

        var code: SchemaGraphQL.ID { __data["code"] }
        var name: String { __data["name"] }
        var native: String { __data["native"] }
        var phone: String { __data["phone"] }
        var continent: Continent { __data["continent"] }
        var capital: String? { __data["capital"] }
        var currency: String? { __data["currency"] }
        var languages: [Language] { __data["languages"] }
        var emoji: String { __data["emoji"] }

        /// Country.Continent
        ///
        /// Parent Type: `Continent`
        struct Continent: SchemaGraphQL.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { SchemaGraphQL.Objects.Continent }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("code", SchemaGraphQL.ID.self),
            .field("name", String.self),
          ] }

          var code: SchemaGraphQL.ID { __data["code"] }
          var name: String { __data["name"] }
        }

        /// Country.Language
        ///
        /// Parent Type: `Language`
        struct Language: SchemaGraphQL.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { SchemaGraphQL.Objects.Language }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("code", SchemaGraphQL.ID.self),
            .field("name", String.self),
            .field("native", String.self),
          ] }

          var code: SchemaGraphQL.ID { __data["code"] }
          var name: String { __data["name"] }
          var native: String { __data["native"] }
        }
      }
    }
  }

}