//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

protocol calculatingDelegate {
    func didTapExpressionCorrect()
    func didAddOperator()
}

class ViewController: UIViewController {
  
    
    var expressionCorrectDelegate: calculatingDelegate!
    var canAddOperatorDelegate: calculatingDelegate!
    
    // MARK: - Outlets
    let calculating = Calculating()
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    // MARK: - Action

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                calculating.addNewNumber(i)
            }
        }
    }

    @IBAction func plus() {
        canAddOperatorDelegate.didAddOperator()
        calculating.plus()
        
    }

    @IBAction func minus() {
        canAddOperatorDelegate.didAddOperator()
        calculating.minus()
    }

    @IBAction func equal() {
        expressionCorrectDelegate.didTapExpressionCorrect()
        textView.text = calculating.calculateTotal()
    }
    
}


extension ViewController: calculatingDelegate {
    func didTapExpressionCorrect(){
        var isExpressionCorrect: Bool{
        if let stringNumber = calculating.stringNumbers.last {
            if stringNumber.isEmpty {
                if calculating.stringNumbers.count == 1 {
                                       let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
                                        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                       self.present(alertVC, animated: true, completion: nil)
                } else {
                                       let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
                                       alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                       self.present(alertVC, animated: true, completion: nil)
                }
                return false
            }
        }
        return true
    }
    }
    
    func didAddOperator(){
        var canAddOperator: Bool { //
            if let stringNumber = calculating.stringNumbers.last {
                if stringNumber.isEmpty {
                                    let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
                                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                    self.present(alertVC, animated: true, completion: nil)
                    return false
                }
            }
            return true
        }
    }
}
