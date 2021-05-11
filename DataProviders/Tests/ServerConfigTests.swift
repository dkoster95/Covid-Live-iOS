//
//  ServerConfigTests.swift
//  DataProvidersTests
//
//  Created by Daniel Koster on 5/11/21.
//

import XCTest
@testable import DataProviders

class ServerConfigTests: XCTestCase {

    func testApiKeyLoaded() {
        let server = Server()
        XCTAssertNotNil(server.headers["x-rapidapi-key"])
    }
    
    func testHostLoaded() {
        let server = Server()
        XCTAssertNotNil(server.headers["x-rapidapi-host"])
    }
    
    func testBaseUrlLoaded() {
        let server = Server()
        XCTAssertFalse(server.staging.baseURL.isEmpty)
    }
}
