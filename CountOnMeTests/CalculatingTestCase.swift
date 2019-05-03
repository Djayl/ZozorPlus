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

    let calculating = Calculating()
    
    func testGivenNil_WillEvaluateExpression_ThenExpressionIsFalse() {
        calculating.stringNumbers = []
        XCTAssert(calculating.isExpressionCorrect == true)
    }
    
    func testGivenStringNumbersIsEmpty_WhenAddingNumber_ThenExpressionIsTrue() {
        calculating.stringNumbers = []
        calculating.addNewNumber(7)
        XCTAssertTrue(calculating.canAddOperator)
    }
    
}
