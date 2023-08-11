// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension SchemaGraphQL {
  class GetCountriesQuery: GraphQLQuery {
    static let operationName: String = "GetCountries"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetCountries { countries { __typename code name emoji } }"#
      ))

    public init() {}

    struct Data: SchemaGraphQL.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { SchemaGraphQL.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("countries", [Country].self),
      ] }

      var countries: [Country] { __data["countries"] }

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
          .field("emoji", String.self),
        ] }

        var code: SchemaGraphQL.ID { __data["code"] }
        var name: String { __data["name"] }
        var emoji: String { __data["emoji"] }
      }
    }
  }

}