//
//  ViewController.swift
//  dentaku
//
//  Created by puyosukedayo on 2020/11/03.
//

import UIKit

enum Operator{ //各演算子"+", "-", "×", "÷"
    case undifind //未定義
    case addition //足し算
    case subtraction //引き算
    case multiplication //掛け算
    case division //割り算
}

class ViewController: UIViewController {
    
    var totalNumber:Decimal = 0 //合計値
    var inputNumber:Decimal = 0 //入力値
    var i:Decimal = 0.1 //小数点
    var i2:Decimal = 0.1//小数点
    var enzanshi = Operator.undifind //演算子記号
    var decimalPointChcker:Bool = false //小数点を押したときtrue

    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numberbutton(_ sender: UIButton) { //数字ボタン
        let tappedButtonNumber:Decimal = Decimal(sender.tag-1)
        
        if enzanshi == .undifind {
            if decimalPointChcker == true {
                totalNumber = totalNumber + (tappedButtonNumber * i)
                label.text = "\(totalNumber)"
                i = i * 0.1
            } else {
                totalNumber = (totalNumber * 10) + tappedButtonNumber
                label.text = "\(totalNumber)"
            }
        } else {
            if decimalPointChcker == true {
                inputNumber = inputNumber + (tappedButtonNumber * i2)
                label.text = "\(inputNumber)"
                i2 = i2 * 0.1
            } else {
                inputNumber = (inputNumber * 10) + tappedButtonNumber
                label.text = "\(inputNumber)"
            }
        }
    }
    
    @IBAction func decimalPointButton(_ sender: UIButton) { //小数点ボタン
        decimalPointChcker = true
        let point:String = "."
        if label.text!.contains(".") {
            
        } else {
            label.text! += point
        }
    }
    
    @IBAction func calcButton(_ sender: UIButton) { //演算子ボタン
        switch sender.currentTitle {
        case "+":
            sender.tag = 15
            enzanshi = .addition
        case "-":
            sender.tag = 14
            enzanshi = .subtraction
        case "×":
            sender.tag = 13
            enzanshi = .multiplication
        case "÷":
            sender.tag = 12
            enzanshi = .division
        default:
            enzanshi = .undifind
        }
        decimalPointChcker = false
    }
    @IBAction func equalButton(_ sender: UIButton) { //"="ボタン
        var answer:Decimal = 0
        
        switch enzanshi {
        case .addition:
            answer = totalNumber + inputNumber
        case .subtraction:
            answer = totalNumber - inputNumber
        case .multiplication:
            answer = totalNumber * inputNumber
        case .division:
            answer = totalNumber / inputNumber
        case .undifind:
            answer = totalNumber
        }
        label.text = "\(answer)"
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        totalNumber = 0 //合計値
        inputNumber = 0 //入力値
        i = 0.1 //小数点
        i2 = 0.1 //小数点
        enzanshi = .undifind //演算子記号
        decimalPointChcker = false
        label.text = "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = "0"
    }


}

