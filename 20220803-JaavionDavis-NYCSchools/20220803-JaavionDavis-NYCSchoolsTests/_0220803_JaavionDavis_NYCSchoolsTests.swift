//
//  _0220803_JaavionDavis_NYCSchoolsTests.swift
//  20220803-JaavionDavis-NYCSchoolsTests
//
//  Created by Jaavion Davis on 8/3/22.
//

import XCTest
@testable import _0220803_JaavionDavis_NYCSchools

class _0220803_JaavionDavis_NYCSchoolsTests: XCTestCase {
    let schoolVm = SchoolViewModel()
    var apiManager: ApiManager?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apiManager = ApiManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        apiManager = nil
    }
    
    func testAsyncApiCode() {
        let expections = expectation(description: "aysnc api test code")
        apiManager?.getData(url: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json", completionHandler: { data in
            XCTAssertNotEqual(data.count, 2 )
            expections.fulfill()
        })
        wait(for: [expections], timeout: 5)
    }
    
    func testGetSchoolName() {
        let expections = expectation(description: "aysnc api test code")
        apiManager?.getData(url: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json", completionHandler: { data in
            XCTAssertNotEqual(data[0].school_name, "Panther" )
            expections.fulfill()
        })
        wait(for: [expections], timeout: 5)

    }
    
    func testGetSatScore() {
        let expections = expectation(description: "aysnc api test code")
        apiManager?.getData(url: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json", completionHandler: { data in
            XCTAssertNotEqual(data[0].sat_math_avg_score, "54554545454845" )
            expections.fulfill()
        })
        wait(for: [expections], timeout: 5)

    }

}
