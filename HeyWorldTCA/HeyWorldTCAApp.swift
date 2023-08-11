import ComposableArchitecture
import SwiftUI

@main
struct HeyWorldTCAApp: App {
    var body: some Scene {
        WindowGroup {
            CountryListView(
                store: Store(initialState: CountryList.State()) {
                    CountryList()
                }
            )
        }
    }
}
