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
    let amountKey = "counter.amount"
    let historyKey = "counter.history"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ud = UserDefaults.standard
        if ud.object(forKey: amountKey) != nil {
            amount = ud.integer(forKey: amountKey)
        } else {
            amount = 0
        }
        let savedHistory = ud.string(forKey: historyKey) ?? "История изменений:\n"
        
        counter.text = "Значение счётчика: \(amount)"
        historyTextView.text = savedHistory
    }
    
    func currentDateString() -> String {
        let f = DateFormatter()
        f.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return f.string(from: Date())
    }
    
    func save() {
        let ud = UserDefaults.standard
        ud.set(amount, forKey: amountKey)
        ud.set(historyTextView.text, forKey: historyKey)
    }
    
    @IBAction func plus1(_ sender: UIButton) {
        amount += 1
        counter.text = "Значение счётчика: \(amount)"
        historyTextView.text += "[\(currentDateString())]: значение изменено на +1\n"
        save()
    }
    
    @IBAction func minus1(_ sender: UIButton) {
        if amount > 0 {
            amount -= 1
            counter.text = "Значение счётчика: \(amount)"
            historyTextView.text += "[\(currentDateString())]: значение изменено на -1\n"
        } else {
            historyTextView.text += "[\(currentDateString())]: попытка уменьшить значение счётчика ниже 0\n"
        }
        save()
    }
    
    @IBAction func zeroAmount(_ sender: UIButton) {
        amount = 0
        counter.text = "Значение счётчика: \(amount)"
        historyTextView.text += "[\(currentDateString())]: значение сброшено\n"
        save()
    }
}
