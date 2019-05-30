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
    
    
    func testIsExpressionCorrect_WhenStringNumbersContainsNothing_ThenExpressionReturnsTrue() {
        calculating.stringNumbers = []
        XCTAssertTrue(calculating.isExpressionCorrect)
    }
    
    func testIsExpressionCorrect_WhenStringNumbersContainsSomething_ThenExpressionReturnsFalse() {
        calculating.plus()
        XCTAssertFalse(calculating.isExpressionCorrect)
    }
    
    func testIsExpressionCorrect_WhenStringNumbersContainsOneThing_ThenExpressionReturnsFalse() {
        calculating.addNewNumber(1)
        calculating.calculateTotal()
        XCTAssertFalse(calculating.isExpressionCorrect)
    }
    
    func testIsExpressionCorrect_WhenTwoOperatorsAreAdded_ThenExpressionReturnsFalse() {
        calculating.addNewNumber(1)
        calculating.plus()
        calculating.plus()
        XCTAssertFalse(calculating.isExpressionCorrect)
    }
    
    
    func testGivenStringNumbersIsEmpty_WhenAddingNumber_ThenExpressionIsTrue() {
        calculating.stringNumbers = []
        calculating.addNewNumber(7)
        XCTAssertTrue(calculating.canAddOperator)
    }
    
    func testGivenStringNumbersIsEmpty_WhenAddingNumber_ThenFirstStringNumberIsNumberAdded() {
        calculating.addNewNumber(1)
        XCTAssert(calculating.stringNumbers[0] == "1")
    }
    
    func testGivenClear_WhenStringNumbersContainsAnything_ThenStringNumbersIsCleared() {
        calculating.clear()
        XCTAssert(calculating.stringNumbers[calculating.stringNumbers.count-1] == "")
        XCTAssert(calculating.operators == ["+"])
    }
    
    func testGivenStringNumbersContainsSomething_WhenSubstraction_ThenSubstractionSignIsAdded() {
        calculating.addNewNumber(3)
        calculating.minus()
        XCTAssert(calculating.operators[1] == "-")
        XCTAssert(calculating.stringNumbers[0] == "3")
    }
    
    func testGivenCanAddOperator_WhenStringNumberContainsSomething_ThenCanAddOperatorReturnTrue() {
        let _ = calculating.addNewNumber(1)
        XCTAssertTrue(calculating.canAddOperator)
    }
    
    func testGivenOne_WhenAddingFour_ThenResultsIsFive() {
        calculating.addNewNumber(1)
        calculating.plus()
        calculating.addNewNumber(4)
        calculating.calculateTotal()
        XCTAssertEqual(calculating.text, "5.0")
    }
    
    func testGivenStringNumbersContainsNine_WhenSquareRoot_ThenResultIsThree() {
        calculating.addNewNumber(9)
        calculating.squareRoot()
        XCTAssertEqual(calculating.text, "3.0")
    }
}
