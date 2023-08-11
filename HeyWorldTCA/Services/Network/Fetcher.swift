import Foundation
import Combine
import Apollo

class Fetcher<Q: GraphQLQuery, Output> {
    /// The query to execute
    private var query: Q
    /// Extract closure is used to convert the Apollo data to a specific Output type
    private var extract: (Q.Data) -> Output?
    
    init(query: Q, extract: @escaping ((Q.Data) -> Output?)) {
        self.query = query
        self.extract = extract
    }

    func fetch() async throws -> Output? {
        try await withCheckedThrowingContinuation({ continuation in
            Network.shared.apollo.fetch(query: query) { result in
                switch result {
                case .success(let graphQLResult):
                    guard let graphQLData = graphQLResult.data else {
                        continuation.resume(throwing: HeyWorldError.emptyDataError)
                        return
                    }
                    
                    guard let data = self.extract(graphQLData) else {
                        continuation.resume(returning: nil)
                        return
                    }
                    
                    continuation.resume(returning: data)
                    
                case .failure(let error):
                    if let sessionError = error as? Apollo.URLSessionClient.URLSessionClientError {
                        switch sessionError {
                        case .networkError(let data, let response, let underlying):
                            continuation.resume(throwing: HeyWorldError.networkError(data: data, response: response, underlying: underlying))
                            
                        case .dataForRequestNotFound(let request):
                            continuation.resume(throwing: HeyWorldError.dataForRequestNotFound(request: request))
                            
                        case .noHTTPResponse(let request):
                            continuation.resume(throwing: HeyWorldError.noHTTPResponse(request: request))
                            
                        default:
                            continuation.resume(throwing: HeyWorldError.unknownError)
                        }
                    } else {
                        continuation.resume(throwing: HeyWorldError.unknownError)
                    }
                }
            }
        })
    }
}
