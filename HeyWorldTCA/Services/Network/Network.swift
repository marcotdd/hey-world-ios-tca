import Foundation
import Apollo

class Network {
    static let shared = Network()
    
    let url = "https://countries.trevorblades.com/"
    private(set) lazy var apollo = ApolloClient(url: URL(string: url)!)
}
