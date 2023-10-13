# Hey World - iOS Application
A SwiftUI TCA sample code. The goal of Hey World is to present informations for each country of the world. 🌍

<img src="https://github.com/marcotdd/hey-world-ios-tca/assets/15362911/3c65d826-0414-4d85-83da-9143950dfab6" width="400" />

## Requirements

- Xcode 14 (with Swift 5.7)
- iOS 16 SDK
- iOS 16 deployment target

## GraphQL

### Fetch
This is used to fetch the GraphQL schema
```console
./apollo-ios-cli fetch-schema --path ./HeyWorldTCA/GraphQL/apollo-codegen-config.json
```

### Generate
This is used to generate Swift source code
```console
./apollo-ios-cli generate --path ./HeyWorldTCA/GraphQL/apollo-codegen-config.json
```

## Third Party Software
- [The Composable Architecture 1.2.0](https://github.com/pointfreeco/swift-composable-architecture) - TCA, for short, is a library for building applications in a consistent and understandable way.
- [Apollo iOS 1.4.0](https://github.com/apollographql/apollo-ios) - It allows to execute queries and mutations against a GraphQL server, and returns results as query-specific Swift types.
