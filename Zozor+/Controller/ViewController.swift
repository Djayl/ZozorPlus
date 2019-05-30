//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    let calculating = Calculating()
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculating.warningHandlerDelegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(updateDisplay(notification:)), name: Notification.Name(rawValue: "updateDisplay"), object: nil)
    }
    
    // MARK: - Action
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                calculating.addNewNumber(i)
            }
        }
    }
    
    @IBAction func plus() {
        calculating.plus()
    }
    
    @IBAction func minus() {
        calculating.minus()
    }
    
    @IBAction func equal() {
        calculating.calculateTotal()
    }
    
    @IBAction func squareRoot() {
        calculating.squareRoot()
        
    }
    
    @objc private func updateDisplay(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        let value = userInfo["value"] as? String
        textView.text = value
    }
    
}

extension ViewController: WarningHandler {
    func displayWarning(message: String) {
        let alertVC = UIAlertController(title: "Zéro!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
        
    }
}

