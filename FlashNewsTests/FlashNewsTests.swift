//
//  FlashNewsTests.swift
//  FlashNewsTests
//
//  Created by Balu Naik on 11/9/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import XCTest
import ObjectMapper
import SwiftyJSON
@testable import FlashNews

class FlashNewsTests: XCTestCase {
    var connector: FNNetworkConnector!
    
    override func setUp() {
        super.setUp()
        self.connector = FNNetworkConnector()
        continueAfterFailure = true
    }
    
    override func tearDown() {
        self.connector = nil
        super.tearDown()
    }
    
    func test1_HeadLinesCall_InvalidParms() {
        FNServiceURL.API_KEY = "1234567888" //Invalid API Key
        let expectation = self.expectation(description:"Asynchronous call expectation status code: 400")
        self.connector.performHeadLineRequestForCountryCode("", "", success: { (response) in
            XCTFail("Invalid API key expectation status code: 400")
            expectation.fulfill()
        }) { (response) in
            expectation.fulfill()
        }
        waitForExpectations(timeout: 20) { (error) in
            if let error = error {
                XCTFail("timeout errored: \(error)")
            }
        }
    }
    
    func test2_HeadLinesCall_ValidParms() {
        FNServiceURL.API_KEY = "378254c29aa14ea280926d361097d9e9"
        let expectation = self.expectation(description:"Asynchronous call expectation status code: 200")
        self.connector.performHeadLineRequestForCountryCode("us", "business", success: { (response) in
            expectation.fulfill()
        }) { (response) in
            XCTFail("Expectation to get head lines inforamtion")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 20) { (error) in
            if let error = error {
                XCTFail("timeout errored: \(error)")
                expectation.fulfill()
            }
        }
    }
    
    func test3_HeadLinesCall_respose_parse() {
        let expectation = self.expectation(description:"Asynchronous call expectation status code: 200")
        self.connector.performHeadLineRequestForCountryCode("us", "business", success: { (response) in
            let sJSONObj = JSON(response)
            if let _ = Mapper<FNArticle>().mapArray(JSONObject:sJSONObj.dictionaryObject?["articles"]!) {
                expectation.fulfill()
            }
        }) { (response) in
            XCTFail("Expectation to map head lines object inforamtion")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 20) { (error) in
            if let error = error {
                XCTFail("timeout errored: \(error)")
                expectation.fulfill()
            }
        }
    }
    
    func test4_AllNewsCall_respose_parse() {
        let expectation = self.expectation(description:"Asynchronous call expectation status code: 200")
        self.connector.performNewsRequestForAll("Sports", success: { (response) in
            let sJSONObj = JSON(response)
            if let _ = Mapper<FNArticle>().mapArray(JSONObject:sJSONObj.dictionaryObject?["articles"]!) {
                expectation.fulfill()
            }
        }) { (response) in
            XCTFail("Expectation to map all news object")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 20) { (error) in
            if let error = error {
                XCTFail("timeout errored: \(error)")
            }
        }
    }
}
