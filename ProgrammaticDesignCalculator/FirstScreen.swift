//
//  ViewController.swift
//  ProgrammaticDesignCalculator
//
//  Created by ahmetburakozturk on 7.10.2023.
//

import UIKit

class FirstScreen: UIViewController {

    var vh = Double()
    var vw = Double()
    
    var firstNumber = Double()
    var secondNumber = Double()
    var resultNumber = Double()
    
    let resultLabel = UITextField()
    
    let plusButton = UIButton()
    let decraseButton = UIButton()
    let multipleButton = UIButton()
    let divineButton = UIButton()
    let equalButton = UIButton()
    
    var isLabelGonnaClean = false
    var isFirstParameter = true
    var lastOperate = ""
    var isFromEqual = false
    var isItGonnaCalculate = false
    var activeButton : UIButton?
    var isActiveEqual = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        vh = view.frame.size.height
        vw = view.frame.size.width
        
        
        setButtonProperties(button: equalButton, titleName: "=", x:vw - vw * 0.24, y: vh -  (vw * 0.21 + (vh * 0.06)), width: vw * 0.21, height: vw * 0.21)
        equalButton.addTarget(self, action: #selector(self.EqualButtonOnClicked), for: UIControl.Event.touchUpInside)

        
        let dotButton = UIButton.init(type: .system)
        setButtonProperties(button: dotButton, titleName: ".", x: vw - vw * 0.48, y: vh - (vw * 0.21 + (vh * 0.06)), width: vw * 0.21, height: vw * 0.21)
        dotButton.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        dotButton.addTarget(self, action: #selector(self.onNumberButtonsClicked(button: )), for: UIControl.Event.touchUpInside)


        let sifirButton = UIButton.init(type: .system)
        setButtonProperties(button: sifirButton, titleName: "0", x: vw - vw * 0.96, y: vh - (vw * 0.21 + (vh * 0.06)), width: vw * 0.46, height: vw * 0.21)
        sifirButton.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        sifirButton.contentHorizontalAlignment = .left
        sifirButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: dotButton.frame.size.width * 0.36 , bottom: 0, right: 0)
        sifirButton.addTarget(self, action: #selector(self.onNumberButtonsClicked(button: )), for: UIControl.Event.touchUpInside)

        
        
        setButtonProperties(button: plusButton, titleName: "+", x:vw - vw * 0.24, y: vh -  (2 * (vw * 0.21) + (vh * 0.07)), width: vw * 0.21, height: vw * 0.21)
        plusButton.addTarget(self, action: #selector(self.onSumButtonOnClicked), for: UIControl.Event.touchUpInside)
        
        let threeButton = UIButton.init(type: .system)
        setButtonProperties(button: threeButton, titleName: "3", x: vw - vw * 0.48, y: vh - (2 * (vw * 0.21) + (vh * 0.07)), width: vw * 0.21, height: vw * 0.21)
        threeButton.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        threeButton.addTarget(self, action: #selector(self.onNumberButtonsClicked(button: )), for: UIControl.Event.touchUpInside)

        let twoButton = UIButton.init(type: .system)
        setButtonProperties(button: twoButton, titleName: "2", x:vw - vw * 0.72, y: vh -  (2 * (vw * 0.21) + (vh * 0.07)), width: vw * 0.21, height: vw * 0.21)
        twoButton.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        twoButton.addTarget(self, action: #selector(self.onNumberButtonsClicked(button: )), for: UIControl.Event.touchUpInside)

        let oneButton = UIButton.init(type: .system)
        setButtonProperties(button: oneButton, titleName: "1", x: vw - vw * 0.96, y: vh - (2 * (vw * 0.21) + (vh * 0.07)), width: vw * 0.21, height: vw * 0.21)
        oneButton.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        oneButton.addTarget(self, action: #selector(self.onNumberButtonsClicked(button: )), for: UIControl.Event.touchUpInside)

        
        
        
        setButtonProperties(button: decraseButton, titleName: "-", x:vw - vw * 0.24, y: vh -  (3 * (vw * 0.21) + (vh * 0.08)), width: vw * 0.21, height: vw * 0.21)
        decraseButton.addTarget(self, action: #selector(self.DecraseButtonOnClicked), for: UIControl.Event.touchUpInside)

        let sixButton = UIButton.init(type: .system)
        setButtonProperties(button: sixButton, titleName: "6", x: vw - vw * 0.48, y: vh - (3 * (vw * 0.21) + (vh * 0.08)), width: vw * 0.21, height: vw * 0.21)
        sixButton.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        sixButton.addTarget(self, action: #selector(self.onNumberButtonsClicked(button: )), for: UIControl.Event.touchUpInside)

        let fiveButton = UIButton.init(type: .system)
        setButtonProperties(button: fiveButton, titleName: "5", x:vw - vw * 0.72, y: vh -  (3 * (vw * 0.21) + (vh * 0.08)), width: vw * 0.21, height: vw * 0.21)
        fiveButton.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        fiveButton.addTarget(self, action: #selector(self.onNumberButtonsClicked(button: )), for: UIControl.Event.touchUpInside)

        let fourButton = UIButton.init(type: .system)
        setButtonProperties(button: fourButton, titleName: "4", x: vw - vw * 0.96, y: vh - (3 * (vw * 0.21) + (vh * 0.08)), width: vw * 0.21, height: vw * 0.21)
        fourButton.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        fourButton.addTarget(self, action: #selector(self.onNumberButtonsClicked(button: )), for: UIControl.Event.touchUpInside)

        
        
        
        
        setButtonProperties(button: multipleButton, titleName: "x", x:vw - vw * 0.24, y: vh -  (4 * (vw * 0.21) + (vh * 0.09)), width: vw * 0.21, height: vw * 0.21)
        multipleButton.addTarget(self, action: #selector(self.MultipleButtonOnClicked), for: UIControl.Event.touchUpInside)

        
        let nineButton = UIButton.init(type: .system)
        setButtonProperties(button: nineButton, titleName: "9", x: vw - vw * 0.48, y: vh - (4 * (vw * 0.21) + (vh * 0.09)), width: vw * 0.21, height: vw * 0.21)
        nineButton.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        nineButton.addTarget(self, action: #selector(self.onNumberButtonsClicked(button: )), for: UIControl.Event.touchUpInside)
        
        let eightButton = UIButton.init(type: .system)
        setButtonProperties(button: eightButton, titleName: "8", x:vw - vw * 0.72, y: vh -  (4 * (vw * 0.21) + (vh * 0.09)), width: vw * 0.21, height: vw * 0.21)
        eightButton.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        eightButton.addTarget(self, action: #selector(self.onNumberButtonsClicked(button: )), for: UIControl.Event.touchUpInside)
        
        let sevenButton = UIButton.init(type: .system)
        setButtonProperties(button: sevenButton, titleName: "7", x: vw - vw * 0.96, y: vh - (4 * (vw * 0.21) + (vh * 0.09)), width: vw * 0.21, height: vw * 0.21)
        sevenButton.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        sevenButton.addTarget(self, action: #selector(self.onNumberButtonsClicked(button: )), for: UIControl.Event.touchUpInside)

        
        
        
        setButtonProperties(button: divineButton, titleName: "/", x:vw - vw * 0.24, y: vh -  (5 * (vw * 0.21) + (vh * 0.1)), width: vw * 0.21, height: vw * 0.21)
        divineButton.addTarget(self, action: #selector(self.DivineButtonOnClicked), for: UIControl.Event.touchUpInside)

        
        let percentageButton = UIButton.init(type: .system)
        setButtonProperties(button: percentageButton, titleName: "%", x: vw - vw * 0.48, y: vh - (5 * (vw * 0.21) + (vh * 0.1)), width: vw * 0.21, height: vw * 0.21)
        percentageButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        percentageButton.backgroundColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1)
        percentageButton.addTarget(self, action: #selector(self.onPercentageButtonOnClicked), for: UIControl.Event.touchUpInside)
        
        
        let convertButton = UIButton.init(type: .system)
        setButtonProperties(button: convertButton, titleName: "+/-", x:vw - vw * 0.72, y: vh -  (5 * (vw * 0.21) + (vh * 0.1)), width: vw * 0.21, height: vw * 0.21)
        convertButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        convertButton.backgroundColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1)
        convertButton.addTarget(self, action: #selector(self.onConvertButtonOnClicked), for: UIControl.Event.touchUpInside)

        
        let AcButton = UIButton.init(type: .system)
        setButtonProperties(button: AcButton, titleName: "AC", x: vw - vw * 0.96, y: vh - (5 * (vw * 0.21) + (vh * 0.1)), width: vw * 0.21, height: vw * 0.21)
        AcButton.addTarget(self, action: #selector(self.acButtonOnClicked), for: UIControl.Event.touchUpInside)
        AcButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        AcButton.backgroundColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1)
        
        
        
        
        
        resultLabel.text = "0"
        resultLabel.textAlignment = .right
        resultLabel.frame = CGRect(x: vw - vw * 0.96, y: vh - (6 * (vw * 0.21) + (vh * 0.13)), width: vw * 0.92, height: vh * 0.12)
        resultLabel.textColor = .white
        resultLabel.font = UIFont.systemFont(ofSize: 90, weight: UIFont.Weight.light)
        resultLabel.backgroundColor = view.backgroundColor
        view.addSubview(resultLabel)
        
    }
    
    func setButtonProperties(button: UIButton, titleName: String, x: Double, y: Double, width: Double, height: Double){
        button.setTitle(titleName, for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.backgroundColor = UIColor.systemOrange
        button.frame = CGRect(x: x, y: y, width: width, height: height)
        button.layer.cornerRadius = button.frame.size.height / 2
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .medium)
        view.addSubview(button)
    }
    
    func changeButtonColor(firstButton: UIButton, secondButton: UIButton){
        firstButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        firstButton.backgroundColor = UIColor.systemOrange
        
        secondButton.setTitleColor(UIColor.systemOrange, for: UIControl.State.normal)
        secondButton.backgroundColor = UIColor.white
        
        activeButton = secondButton
    }
    
    
    func clearButtonColor(){
        if activeButton != nil {
            activeButton!.setTitleColor(UIColor.white, for: UIControl.State.normal)
            activeButton!.backgroundColor = UIColor.systemOrange
        }
        activeButton = nil
    }
    
    @objc func acButtonOnClicked(){
        firstNumber = 0
        secondNumber = 0
        resultNumber = 0
        setResultLabelFont(fontSize: 90)
        resultLabel.text = "0"
        isFirstParameter = true
        lastOperate = ""
        clearButtonColor()
        
    }
    
    
    @objc func onNumberButtonsClicked(button: UIButton){
        
        clearButtonColor()
        let currentNumber = resultLabel.text != "." ? Double(resultLabel.text!)! : 0.0
        
        if resultLabel.text!.count > 8 {
            return
        }
        
        if resultLabel.text!.count > 6  {
            setResultLabelFont(fontSize: 70)
        } else {
            setResultLabelFont(fontSize: 90)
        }
        
        if currentNumber == 0 || isLabelGonnaClean{
            resultLabel.text = button.titleLabel?.text
        } else {
            if button.titleLabel?.text == "." && resultLabel.text!.contains(".") {
                return
            }
            resultLabel.text = "\(resultLabel.text!)\(button.titleLabel?.text ?? "")"
        }
        
        isLabelGonnaClean = false
        isItGonnaCalculate = true
        
    }
    
    
    @objc func onPercentageButtonOnClicked(){
        
        let number = Double(resultLabel.text!)!
        let result = number / 100
        resultLabel.text = String(result)
    }
    
    
    
    @objc func onConvertButtonOnClicked(){
        
        if resultLabel.text != "0" && resultLabel.text != "."{
            let number = Double(resultLabel.text!)!
            let result = number * -1
            
            if number / Double(Int(number)) == 1 {
                resultLabel.text = String(Int(result))
                return
            }
            resultLabel.text = String(result)
        }
    }
    
    
    @objc func onSumButtonOnClicked(){
        
        DoLastOperation(referanceOperate: "+")
        SetActiveButton(button: plusButton)
        isActiveEqual = false
        
        if isItGonnaCalculate {
            lastOperate = "+"
            if isFirstParameter || isFromEqual{
                firstNumber = Double(resultLabel.text!)!
                isFirstParameter = false
                isLabelGonnaClean = true
                isFromEqual = false
                return
            } else {
                secondNumber = Double(resultLabel.text!)!
                let result = firstNumber + secondNumber
                if result / Double(Int(result)) != 1{
                    resultLabel.text = String(result)
                } else {
                    resultLabel.text = String(Int(result))
                }
                isLabelGonnaClean = true
                firstNumber = result
            }
        }
        isItGonnaCalculate = false
    }
    
    
    @objc func DecraseButtonOnClicked(){
        
        DoLastOperation(referanceOperate: "-")
        SetActiveButton(button: decraseButton)
        isActiveEqual = false
        
        if isItGonnaCalculate {
            lastOperate = "-"
            if isFirstParameter || isFromEqual{
                firstNumber = Double(resultLabel.text!)!
                isFirstParameter = false
                isLabelGonnaClean = true
                isFromEqual = false
                return
            }else {
                secondNumber = Double(resultLabel.text!)!
                let result = firstNumber - secondNumber
                if result / Double(Int(result)) != 1{
                    resultLabel.text = String(result)
                } else {
                    resultLabel.text = String(Int(result))
                }
                isLabelGonnaClean = true
                firstNumber = result
            }
        }
        isItGonnaCalculate = false
    }
    
    
    @objc func MultipleButtonOnClicked(){
        
        DoLastOperation(referanceOperate: "*")
        SetActiveButton(button: multipleButton)
        isActiveEqual = false

        if isItGonnaCalculate {
            lastOperate = "*"
            if isFirstParameter || isFromEqual {
                firstNumber = Double(resultLabel.text!)!
                isFirstParameter = false
                isLabelGonnaClean = true
                isFromEqual = false
                return
            } else {
                secondNumber = Double(resultLabel.text!)!
                let result = firstNumber * secondNumber
                if result / Double(Int(result)) != 1{
                    resultLabel.text = String(result)
                } else {
                    resultLabel.text = String(Int(result))
                }
                isLabelGonnaClean = true
                firstNumber = result
            }
        }
        isItGonnaCalculate = false
    }
    
    
    @objc func DivineButtonOnClicked(){
        
        DoLastOperation(referanceOperate: "/")
        SetActiveButton(button: divineButton)
        isActiveEqual = false

        if isItGonnaCalculate {
            lastOperate = "/"
            if isFirstParameter || isFromEqual{
                firstNumber = Double(resultLabel.text!)!
                isFirstParameter = false
                isLabelGonnaClean = true
                isFromEqual = false
                isItGonnaCalculate = false
                return
            } else {
                secondNumber = Double(resultLabel.text!)!
                let result = secondNumber == 0 ? 0 : firstNumber / secondNumber
                if result / Double(Int(result)) != 1{
                    resultLabel.text = String(result)
                } else {
                    resultLabel.text = String(Int(result))
                }
                isLabelGonnaClean = true
                firstNumber = result
            }
        }
        isItGonnaCalculate = false
    }
    
    func DoLastOperation(referanceOperate : String){
        
        if lastOperate != referanceOperate {
            switch lastOperate {
                
            case "+":
                onSumButtonOnClicked()
            case "/":
                DivineButtonOnClicked()
            case "-":
                DecraseButtonOnClicked()
            case "*":
                MultipleButtonOnClicked()
            default:
                return
            }
            lastOperate = referanceOperate
        }
    }
    
    func SetActiveButton(button : UIButton){
        if activeButton == nil {
            activeButton = button
        }
        if !isActiveEqual {
            changeButtonColor(firstButton: activeButton!, secondButton: button)
        }
    }
    
    
    @objc func EqualButtonOnClicked(){
        if activeButton == nil {
            activeButton = equalButton
        }
        isActiveEqual = true
        
        switch lastOperate {
        case "+":
            onSumButtonOnClicked()
        
        case "-":
            DecraseButtonOnClicked()

        case "/":
            DivineButtonOnClicked()
            
        case "*":
            MultipleButtonOnClicked()

        default:
            return
        }
        isFromEqual = true
        isItGonnaCalculate = true
        lastOperate = ""
    }
    
    
    func setResultLabelFont(fontSize: Int){
        resultLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSize), weight: UIFont.Weight.light)
    }


}

