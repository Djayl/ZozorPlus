//
//  CalculatingTestCase.swift
//  CountOnMeTests
//
//  Created by MacBook DS on 03/05/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculatingTestCase: XCTestCase {

    
    
    var calculating: Calculating!
    
    override func setUp() {
        super.setUp()
        calculating = Calculating()
    }
    
//    func setStrings(_ myNumbers: [String], _ myOperators: [String]) {
//        calculating.stringNumbers = myNumbers
//        calculating.operators = myOperators
//    }
    
    func testGivenNil_WillEvaluateExpression_ThenExpressionIsFalse() {
        calculating.stringNumbers = []
        XCTAssert(calculating.isExpressionCorrect == true)
    }
    
    func testIsExpressionCorrect_WhenStringNumbersContainsNothing_ThenExpressionReturnsTrue() {
        calculating.stringNumbers = []
        XCTAssertTrue(calculating.isExpressionCorrect)
    }
    
    
    func testGivenStringNumbersIsEmpty_WhenAddingNumber_ThenExpressionIsTrue() {
        calculating.stringNumbers = []
        let _ = calculating.addNewNumber(7)
        XCTAssertTrue(calculating.canAddOperator)
    }
    
    func testAddNewNumber() {
        
        let _ = calculating.addNewNumber(1)
        
        XCTAssert(calculating.stringNumbers[0] == "1")
        
    }
    
    func testGivenClear_WhenStringNumberContainAnything_ThenStringNumberIsCleared() {
        calculating.clear()
        
        XCTAssert(calculating.stringNumbers[calculating.stringNumbers.count-1] == "")
        XCTAssert(calculating.operators == ["+"])
        
    }
    
    func testGivenCanAddOperator_WhenStringNumberContainSomething_ThenCanAddOperatorReturnTrue() {
        let _ = calculating.addNewNumber(1)
        
        XCTAssertTrue(calculating.canAddOperator)
    }
    
    func testCalculateTotal() {
        
        let _ = calculating.addNewNumber(1)
        
        let _ = calculating.plus()
        let _ = calculating.addNewNumber(4)
        
        //calculating.calculateTotal()
        
        
        XCTAssert(calculating.calculateTotal() == "5.0")
    }
}
