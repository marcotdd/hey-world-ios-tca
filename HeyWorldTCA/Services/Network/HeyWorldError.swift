import Foundation

enum HeyWorldError: Error, LocalizedError {
    case noHTTPResponse(request: URLRequest?)
    case dataForRequestNotFound(request: URLRequest?)
    case networkError(data: Data, response: HTTPURLResponse?, underlying: Error)
    case emptyDataError
    case unknownError
    
    public var errorDescription: String {
        switch self {
        case .noHTTPResponse(let request):
            return "The request did not receive an HTTP response. Request: \(String(describing: request))"
            
        case .dataForRequestNotFound(let request):
            return "URLSessionClient was not able to locate the stored data for request \(String(describing: request))"
        
        case .networkError(_, _, let underlyingError):
            return "A network error occurred: \(underlyingError.localizedDescription)"

        case .emptyDataError:
            return "No data for this element."
            
        case .unknownError:
            return "An error occurred."
        }
    }
}
