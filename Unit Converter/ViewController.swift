//
//  ViewController.swift
//  Unit Converter
//
//  Created by Yashom on 11/09/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var typeSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationScene : MainViewController = segue.destination as! MainViewController
        
        let segment = typeSegment.selectedSegmentIndex
        switch segment{
            
        case 0:
            destinationScene.fromSegmentIndexOne = "Celsius"
            destinationScene.fromSegmentIndexTwo = "Fahrenheit"
            destinationScene.toSegmentIndexOne = "Fahrenheit"
            destinationScene.toSegmentIndexTwo = "Celsius"
        
        case 1:
            destinationScene.fromSegmentIndexOne = "Indian Rupee"
            destinationScene.fromSegmentIndexTwo = "Dollar"
            destinationScene.toSegmentIndexOne = "Dollar"
            destinationScene.toSegmentIndexTwo = "Indian Rupee"
            
        case 2:
            destinationScene.fromSegmentIndexOne = "Meter"
            destinationScene.fromSegmentIndexTwo = "Centimeter"
            destinationScene.toSegmentIndexOne = "Centimeter"
            destinationScene.toSegmentIndexTwo = "Meter"
            
        case 3:
            destinationScene.fromSegmentIndexOne = "Litre"
            destinationScene.fromSegmentIndexTwo = "Gallon"
            destinationScene.toSegmentIndexOne = "Gallon"
            destinationScene.toSegmentIndexTwo = "Litre"
            
        case 4:
            destinationScene.fromSegmentIndexOne = "Kilometer"
            destinationScene.fromSegmentIndexTwo = "Mile"
            destinationScene.toSegmentIndexOne = "Mile"
            destinationScene.toSegmentIndexTwo = "Kilometer"
            
        default:
            print("Error preparing")
            
        }
        
    }


}

