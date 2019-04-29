//
//  Calculating.swift
//  CountOnMe
//
//  Created by MacBook DS on 23/04/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import Foundation

class Calculating {
    
    var stringNumbers: [String] = [String()] //
    var operators: [String] = ["+"] //
    
//    var isExpressionCorrect: Bool { //
//        if let stringNumber = stringNumbers.last {
//            if stringNumber.isEmpty {
//                if stringNumbers.count == 1 {
////                   let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
////                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
////                    self.present(alertVC, animated: true, completion: nil)
//                } else {
////                   let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
////                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
////                    self.present(alertVC, animated: true, completion: nil)
//                }
//                return false
//            }
//        }
//        return true
//    }
    
//    func isExpressionCorrect() -> Bool{
//        if let stringNumber = stringNumbers.last {
//            if stringNumber.isEmpty {
//                if stringNumbers.count == 1 {
//                    //                   let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
//                    //                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                    //                    self.present(alertVC, animated: true, completion: nil)
//                } else {
//                    //                   let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
//                    //                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                    //                    self.present(alertVC, animated: true, completion: nil)
//                }
//                return false
//            }
//        }
//        return true
//    }
//
//
    
//    var canAddOperator: Bool { //
//        if let stringNumber = stringNumbers.last {
//            if stringNumber.isEmpty {
////                let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
////                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
////                self.present(alertVC, animated: true, completion: nil)
//                return false
//            }
//        }
//        return true
//    }
    // MARK: - Methods
    
    func addNewNumber(_ newNumber: Int) { //
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
        updateDisplay()
    }
    
    func calculateTotal() -> String { //
//        if !isExpressionCorrect {
//            return
//        }
        
        var total = 0
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                }
            }
            
        }
        
        textView.text = textView.text + "=\(total)"
    
        clear()
    }
    
    func updateDisplay() { //
        var text = ""
        for (i, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += operators[i]
            }
            // Add number
            text += stringNumber
        }
        textView.text = text
    }
    
    func clear() { //
        stringNumbers = [String()]
        operators = ["+"]
        
    }
    
    func plus() {
        //if canAddOperator {
            operators.append("+")
            stringNumbers.append("")
            updateDisplay()
        //}
    }
    func minus() {
        //if canAddOperator {
            operators.append("-")
            stringNumbers.append("")
            updateDisplay()
        //}
    }
    
}


