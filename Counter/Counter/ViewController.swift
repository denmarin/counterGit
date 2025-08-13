//
//  ViewController.swift
//  Counter
//
//  Created by Yury Semenyushkin on 12.08.25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    var amount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter.text = "Значение счётчика: \(amount)"
        historyTextView.text = "История изменений:\n"
    }
    
    func currentDateString() -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            return formatter.string(from: Date())
        }

    @IBAction func plus1(_ sender: UIButton) {
        amount += 1
        counter.text = "Значение счётчика: \(amount)"
        historyTextView.text += "[\(currentDateString())]: значение изменено на +1\n"
    }
    
    @IBAction func minus1(_ sender: UIButton) {
        if amount > 0 {
            amount -= 1
            counter.text = "Значение счётчика: \(amount)"
            historyTextView.text += "[\(currentDateString())]: значение изменено на -1\n"
        } else {
            historyTextView.text += "[\(currentDateString())]: попытка уменьшить значение счётчика ниже 0\n"
        }
    }
    
    @IBAction func zeroAmount(_ sender: UIButton) {
        amount = 0
        counter.text = "Значение счётчика: \(amount)"
        historyTextView.text += "[\(currentDateString())]: значение сброшено\n"
    }
    
}

