//
//  HeyWorldTCATests.swift
//  HeyWorldTCATests
//
//  Created by Taddei, Marco (VDM) on 27/01/23.
//

import XCTest
import ComposableArchitecture
@testable import HeyWorldTCA

@MainActor
final class HeyWorldTCATests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCountryList() async {
        let store = TestStore(initialState: CountryList.State()) {
            CountryList()
        } withDependencies: {
            $0.apiClient.fetchCountries = {
                CountryLight.mokedList
            }
        }
        
        await store.send(.appear) {
            $0.viewState = .loading
        }
        
        await store.receive(.fetchCountries)
        
        await store.receive(.countriesResponse(.success(CountryLight.mokedList))) {
            $0.viewState = .success
            $0.countries = CountryLight.mokedList
        }
    }
}
