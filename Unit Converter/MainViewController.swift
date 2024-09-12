//
//  MainViewController.swift
//  Unit Converter
//
//  Created by Yashom on 11/09/24.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var fromSegment: UISegmentedControl!
    
    @IBOutlet weak var toSegment: UISegmentedControl!
    
    @IBOutlet weak var ioTextField: UITextField!
    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    var fromSegmentIndexOne = String()
    var fromSegmentIndexTwo = String()
    var toSegmentIndexOne = String()
    var toSegmentIndexTwo = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fromSegment.setTitle(fromSegmentIndexOne, forSegmentAt: 0)
        fromSegment.setTitle(fromSegmentIndexTwo, forSegmentAt: 1)
        
        toSegment.setTitle(toSegmentIndexOne, forSegmentAt: 0)
        toSegment.setTitle(toSegmentIndexTwo, forSegmentAt: 1)
        
        
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        if ioTextField.text == "" {
             mainLabel.text = "Atleast enter a value"
         }
         
         else {
             
             if isdouble(Arrayofstrings: ioTextField.text!){
                 
                 let answer =  performCalculation(From: fromSegment.titleForSegment(at: fromSegment.selectedSegmentIndex)! , To: toSegment.titleForSegment(at: toSegment.selectedSegmentIndex)!, TextField: Double(ioTextField.text!)!)
                 
                 
                 mainLabel.text = answer
                 
             }
             
             else {
                 
                 mainLabel.text = "Enter Valid Number"
                 
             }
             
         }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
    

    func isdouble(Arrayofstrings a:String ...) -> Bool {
    //    print (a)         // for error finding -_-
        var isdub = true
        for i in a {
            
            let doubcheck:Double? = Double(i)
            if doubcheck == nil{
                isdub = false
            }
            
        }
        return isdub
    }

func performCalculation(From f: String, To t: String, TextField num: Double) -> String {
    
    // If units are the same, return the same number
    if f == t {
        return "\(num) \(t)"
    }
    
    // Currency Conversion
    else if f == "Dollar" && t == "Indian Rupee" {
        let answer = "\(round(num * 82.50 * 100) / 100) \(t)"  // Updated conversion rate
        return answer
    }
    else if f == "Indian Rupee" && t == "Dollar" {
        let answer = "\(round(num * 0.012 * 100) / 100) \(t)"  // Updated conversion rate
        return answer
    }
    
    // Length Conversion
    else if f == "Meter" && t == "Centimeter" {
        let answer = "\(round(num * 100 * 100) / 100) \(t)"
        return answer
    }
    else if f == "Centimeter" && t == "Meter" {
        let answer = "\(round(num * 0.01 * 100) / 100) \(t)"
        return answer
    }
    
    // Temperature Conversion
    else if f == "Celsius" && t == "Fahrenheit" {
        let fahrenheit = round(((num * (9/5)) + 32) * 100) / 100
        let answer = "\(fahrenheit) \(t)"
        return answer
    }
    else if f == "Fahrenheit" && t == "Celsius" {
        let celsius = round(((num - 32) * (5/9)) * 100) / 100
        let answer = "\(celsius) \(t)"
        return answer
    }
    
    // Volume Conversion
    else if f == "Litre" && t == "Gallon" {
        let gallon = round((num * 0.264172) * 100) / 100  // 1 liter = 0.264172 gallons
        let answer = "\(gallon) \(t)"
        return answer
    }
    else if f == "Gallon" && t == "Litre" {
        let litre = round((num * 3.78541) * 100) / 100  // 1 gallon = 3.78541 liters
        let answer = "\(litre) \(t)"
        return answer
    }
    
    // Distance Conversion
    else if f == "Kilometer" && t == "Mile" {
        let mile = round((num * 0.621371) * 100) / 100  // 1 kilometer = 0.621371 miles
        let answer = "\(mile) \(t)"
        return answer
    }
    else if f == "Mile" && t == "Kilometer" {
        let kilometer = round((num * 1.60934) * 100) / 100  // 1 mile = 1.60934 kilometers
        let answer = "\(kilometer) \(t)"
        return answer
    }
    
    // If no valid conversion is found
    else {
        return "Invalid conversion"
    }
}

