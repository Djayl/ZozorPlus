//
//  Calculating.swift
//  CountOnMe
//
//  Created by MacBook DS on 23/04/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

protocol WarningHandler {
    func displayWarning(message: String)
}

import Foundation

class Calculating {
    
    var warningHandlerDelegate: WarningHandler?
    
    var stringNumbers: [String] = [String()] //
    var operators: [String] = ["+"] //
    var text = "" {
        didSet {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "updateDisplay"), object: nil, userInfo: ["value": text])
        }
    }
    
    var isExpressionCorrect: Bool { //
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumbers.count == 1 {
                    warningHandlerDelegate?.displayWarning(message: "Démarrez un nouveau calcul !")
                } else {
                    warningHandlerDelegate?.displayWarning(message: "Entrez une expression correcte !")
                }
                return false
            }
        }
        return true
    }
    
    
    var canAddOperator: Bool { //
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                warningHandlerDelegate?.displayWarning(message: "Expression incorrecte !")
                return false
            }
        }
        return true
    }
    // MARK: - Methods
    
    func addNewNumber(_ newNumber: Int)  { //
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
        text = updateDisplay()
    }
    
    func calculateTotal()   {
        if !isExpressionCorrect {
            text = ""
        }
        var total = 0.0
       
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Double(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                }
            }
        }
        clear()
        text = "\(total)"
    }
    

    func updateDisplay() -> String  {
        var text = ""
        for (i, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += operators[i]
            }
            // Add number
            text += stringNumber
        }
        
         return text
    }
    
    func clear() { //
        stringNumbers = [String()]
        operators = ["+"]
        text = ""
    }
    
    func plus()  {
        if canAddOperator {
            operators.append("+")
            stringNumbers.append("")
        }
        text = updateDisplay()
    }
    
    func minus()  {
        if canAddOperator {
            operators.append("-")
            stringNumbers.append("")
        }
        text = updateDisplay()
    }
    
    func squareRoot()  {
        
        if canAddOperator {
            guard let result = Double(text) else { return }
            clear()
            let squareRootValue = sqrt(result)
            if let stringNumber = stringNumbers.last {
                var stringNumberMutable = stringNumber
                stringNumberMutable += "\(squareRootValue)"
                stringNumbers[stringNumbers.count-1] = stringNumberMutable
            }
            text = String(squareRootValue)
        }
        text = updateDisplay()
    }
        
}
