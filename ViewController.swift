//
//  ViewController.swift
//  Assignment1_Calculator_Part3
//
//  Created by Abdeali Mody on 2020-10-25.
//  Student ID: 301085484
//  Version 3.0
//  Project Description: Adding landscape orentation of calculator with five new buttons and its functinality.

import UIKit

class ViewController: UIViewController {
    
    //Declaring the variables : Datatype = value.
    var operand1: Double = 0
    var operand2: Double = 0
    var activeOperation : String = ""
    var operators: String = ""
    var result: String = ""
    
    // @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var ResultLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
// This function will be called when any of the number button are pressed. It also includes button such as Clear, Backspace, +/- , Pi & dot(.)
    @IBAction func onNumberButton_Press(_ sender: UIButton)
    {
        switch sender.titleLabel!.text!
    {
    case "C":
        ResultLabel.text! = "0"
        
        //Here I am cleaning the result variable as we are using this variable to save the numbers the user enter again ,we cannot have "trunk values".
        result = ""
    
    case "⌫":
        //popLast method will remove the last entered number or operator from the display panel.
        ResultLabel.text!.popLast()
            
        if((ResultLabel.text!.count < 1) || (ResultLabel.text! == "-"))
            {
                ResultLabel.text! = "0"
            }
    
    case ".":
    // If there is no decimal in operands then it will allow user to add one.
            if(!ResultLabel.text!.contains("."))
            {
                ResultLabel.text! += "."
            }
    
    case "+/-":
    //if the number is 5 and we press this button it is going to change to -5 and vice-versa
    if(ResultLabel.text! != "0")
    {
            if(!ResultLabel.text!.contains("-"))
            {
                ResultLabel.text!.insert("-", at: ResultLabel.text!.startIndex)
            }
            else
            {
                ResultLabel.text!.remove(at: ResultLabel.text!.startIndex)
            }
     }
    case "π":
    // It clears the label and puts the value of π
        ResultLabel.text!.removeLast()
        ResultLabel.text! = String(Float32.pi)
        
        default:
            if(ResultLabel.text == "0")
            {
                ResultLabel.text! = sender.titleLabel!.text!
                result += sender.titleLabel!.text!
                
            }
            else
            {
                ResultLabel.text! += sender.titleLabel!.text!
                result += sender.titleLabel!.text!
            }
        /*if(ResultLabel.text!.contains("."))
            {
                print(Double(ResultLabel.text!)!)
            }*/
        }
    }
    //This function is completely use for oerator buttons.
    @IBAction func onOperatorButton_Press(_ sender: Any)
    {
        // when any of the operator is clicked this function gets executed
        activeOperation = (sender as AnyObject).titleLabel!.text!
        
        // First if statement is used just to check if I am not using sin,cos,tan or sqrt buttons.
        if (((activeOperation != "sin") && (activeOperation != "cos") && (activeOperation != "tan") && (activeOperation != "√")))
        {
            //we need to check that the entered number is operand1 or operand2, now we will save the first value in operand1.
            if operand1 == 0
            {
                print(result)
                operand1 = Double(result)!
                result = ""
            }
            else
            {
                if (operators != "%"){
                    operand2 = Double(result)!
                    result = ""
                }
                
            }
            
        }
        
        //let singleOperandOperator = ["sin", "cos", "tan", "√"]
        
        /*if(activeOperation == "")
        {
            activeOperation = operators
            reset = true;
        }
        
        if (result != "0.0")
        {
            return // exit the code block
        }
        
        if(operand1 != 0.0)
        {
            operand2 = Double(ResultLabel.text!)!
        }
        else
        {
            operand1 = Double(ResultLabel.text!)!
        }*/
        
        /*if(operand2 == 0.0 && !singleOperandOperator.contains(operators) && operators != "=")
        {
            return
            // exit the block if operand2 is zero.
        }*/
        
       
        switch(activeOperation)
        {
            case "+":
                ResultLabel.text! += "+"
                operators = "+"
    
            case "-":
                ResultLabel.text! += "-"
                operators = "-"
                    
            case "x":
                ResultLabel.text! += "x"
                operators = "x"
        
            case "÷":
                ResultLabel.text! += "÷"
                operators = "÷"
                    
            case "%":
                ResultLabel.text! += "%"
                operators = "%"
            
            case "√":
                ResultLabel.text! = "√"
                operators = "√"
        
            case "sin":
                ResultLabel.text! = "sin("
                operators = "sin"
        
            case "cos":
                ResultLabel.text! = "cos("
                operators = "cos"
            
            case "tan":
                ResultLabel.text! = "tan("
                operators = "tan"
        
            case "=":
                var test = ""
                
                //just calling the calculate function and passing the the parameters. This will help us to call a particular operator.
                test = calculate(math: operators)
                    
                //Now we already have the value isnside the test variable, so we display the output in result panel.
                ResultLabel.text! = test
                    
            default:
                print("error")
            }
    }
    // This function contains the calculation part about each operators used in calculator.
    func calculate(math: String) -> String
    {
        var finalresult = ""
        
        //here we check the operator to go to the correct operation
        if (math == "+")
        {
            //converting string to float32, Float32 is used because it will just give me 8 values after decimal.
            finalresult = String(Float32(operand1 + operand2))
        }
        else if (math == "-")
        {
            finalresult = String(Float32(operand1 - operand2))
        }
        else if (math == "x")
        {
            finalresult = String(Float32(operand1 * operand2))
        }
        else if (math == "÷")
        {
            finalresult = String(Float32(operand1 / operand2))
        }
        else if (math == "%")
        {
            // Calulating the percentage of just oerand1.
            finalresult = String(Float32((operand1) / 100))
        }
        else if (math == "√")
        {
            //sqrt is an in build funtion used to get the sqaure root of given number.
            finalresult = String(sqrt(operand1))
        }
        else if (math == "sin")
        {
            // I am rounding off the numbers just to avoid unwanted long values and then using the formula to calculate value.
            finalresult = String(Double(round(1000000000*sin(operand1 * Double.pi/180)))/1000000000)
        }
        else if (math == "cos")
        {
            finalresult = String(Double(round(1000000000*cos(operand1 * Double.pi/180)))/1000000000)
        }
        else if (math == "tan")
        {
            finalresult = String(Double(round(1000000000*tan(operand1 * Double.pi/180)))/1000000000)
        }
        
        //Here we need to clear the operand so user can perform more operations.
        operand1 = 0.0
        operand2 = 0.0
        result = finalresult
        
        //returning the final result.
        return finalresult
    }
}
