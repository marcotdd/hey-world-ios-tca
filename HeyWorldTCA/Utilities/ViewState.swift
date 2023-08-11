import Foundation

enum ViewState {
    case initial
    case loading
    case success
    case failure(HeyWorldError)
}

extension ViewState: Equatable {
    static func == (lhs: ViewState, rhs: ViewState) -> Bool {
        switch (lhs, rhs) {
        case (.initial, .initial):
            return true
            
        case (.loading, .loading):
            return true

        case (.success, .success):
            return true
            
        case (.failure, .failure):
            return true
            
        default:
            return false
        }
    }
}
