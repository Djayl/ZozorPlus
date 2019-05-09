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
    
    func testIsExpressionCorrect_WhenStringNumbersContainsSomething_ThenExpressionReturnsFalse() {
        let _ = calculating.plus()
        XCTAssertFalse(calculating.isExpressionCorrect)
    }
    
    func testIsExpressionCorrect_WhenStringNumbersContainsOneThing_ThenExpressionReturnsFalse() {
        let _ = calculating.addNewNumber(1)
        let _ = calculating.calculateTotal()
        XCTAssertFalse(calculating.isExpressionCorrect)
    }
    
    func testIsExpressionCorrect_WhenTwoOperatorsAreAdded_ThenExpressionReturnsFalse() {
        let _ = calculating.addNewNumber(1)
        let _ = calculating.plus()
        let _ = calculating.plus()
        XCTAssertFalse(calculating.isExpressionCorrect)
    }
    
    
    func testGivenStringNumbersIsEmpty_WhenAddingNumber_ThenExpressionIsTrue() {
        calculating.stringNumbers = []
        let _ = calculating.addNewNumber(7)
        XCTAssertTrue(calculating.canAddOperator)
    }
    
    func testGivenStringNumbersIsEmpty_WhenAddingNumber_ThenFirstStringNumberIsNumberAdded() {
        let _ = calculating.addNewNumber(1)
        XCTAssert(calculating.stringNumbers[0] == "1")
        
    }
    
    func testGivenClear_WhenStringNumbersContainsAnything_ThenStringNumbersIsCleared() {
        calculating.clear()
        XCTAssert(calculating.stringNumbers[calculating.stringNumbers.count-1] == "")
        XCTAssert(calculating.operators == ["+"])
        
    }
    
    func testGivenStringNumbersContainsSomething_WhenSubstraction_ThenSubstractionSignIsAdded() {
        let _ = calculating.addNewNumber(3)
        let _ = calculating.minus()
        XCTAssert(calculating.operators[1] == "-")
        XCTAssert(calculating.stringNumbers[0] == "3")
        
        
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
    
    func testGivenStringNumbersContainsNine_WhenSquareRoot_ThenResultIsThree() {
        let _ = calculating.addNewNumber(9)
       
        
        XCTAssert(calculating.squareRoot() == "3.0")
    }
}
