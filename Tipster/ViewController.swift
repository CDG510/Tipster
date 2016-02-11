//
//  ViewController.swift
//  Tipster
//
//  Created by Christian Gonzalez on 1/9/16.
//  Copyright © 2016 Christian Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var FinalTipLabel: UILabel!
    
    var calculating = ""
    
    @IBOutlet weak var middlePercent: UILabel!
    
    @IBOutlet weak var leftPercent: UILabel!
    
    @IBOutlet weak var rightPercent: UILabel!
    
    @IBOutlet weak var leftTip: UILabel!
    
    @IBOutlet weak var midTip: UILabel!
    
    @IBOutlet weak var rightTip: UILabel!
    
    @IBOutlet weak var leftTotal: UILabel!
    
    
    @IBOutlet weak var midTotal: UILabel!
    
    
    @IBOutlet weak var rightTotal: UILabel!
    
    @IBOutlet weak var groupSize: UILabel!
    
    @IBAction func tipPercentage(sender: UISlider) {
    
    }
    
    @IBAction func groupAmount(sender: UISlider) {
        
        if Int(FinalTipLabel.text!) > 0 {
            let sizeOfGroup = Int(sender.value)
            groupSize.text = String( sizeOfGroup)
            let newLeftPercent = leftPercent.text!
            let newMidPercent = middlePercent.text!
            let newRightPercent = rightPercent.text!
            
            leftTip.text = String(format: "%.2f", adjustTips(Double(newLeftPercent)!))
            midTip.text = String(format: "%.2f", adjustTips(Double(newMidPercent)!))
            rightTip.text = String(format: "%.2f", adjustTips(Double(newRightPercent)!))
            
            print("LOOK AT THE", leftTip.text!)
            
            leftTotal.text = String(format: "%.2f", adjustTips(Double(newLeftPercent)!) + Double(FinalTipLabel.text!)! / Double(groupSize.text!)!)
            rightTotal.text = String(format: "%.2f", adjustTips(Double(newRightPercent)!) + Double(FinalTipLabel.text!)! / Double(groupSize.text!)!)
            midTotal.text = String(format: "%.2f", adjustTips(Double(newMidPercent)!) + Double(FinalTipLabel.text!)! / Double(groupSize.text!)!)
        }
        else {
            return
        }
        
    }

    
    
    
    func adjustTips( percent: Double) -> Double  {
        let newTotal = ( (Double(FinalTipLabel.text!)! * (Double(percent) * 0.01)) / Double(groupSize.text!)!)
        print(Double(newTotal), "THIS IS SHOULD BE LEFTTIPPAID")
        return Double(newTotal)
    }
    
    func calculateTip (percent: Int) -> Double {
        //basically
        
        let finalTipPercent =  (Double(calculating)! * (Double(percent) * 0.01) / Double(groupSize.text!)! )
        return finalTipPercent
    }
    
    func modifyTotal (percent: Int) -> Double {
        let adjustedTotal = ((Double(calculating)! * (Double(percent) * 0.01) + Double(calculating)!) / Double(groupSize.text!)!)
        return adjustedTotal
    }

    
    @IBAction func percentageAmount(sender: UISlider) {
        if Int(FinalTipLabel.text!) > 0 {
            let midPercent = Int(sender.value)
            let leftPercentage = (midPercent-5)
            let rightPercentage = (midPercent + 5)
            //set row of percentages
            
            
            middlePercent.text = String(midPercent)
            
            
            leftPercent.text = String(leftPercentage)
            
            rightPercent.text = String(rightPercentage)
            //find the percentages done
            
            //
            leftTip.text = String(format: "%.2f", calculateTip(leftPercentage))
            midTip.text = String(format: "%.2f", calculateTip(midPercent))
            rightTip.text = String(format: "%.2f", calculateTip(rightPercentage))
            
            
            leftTotal.text = String(format: "%.2f", modifyTotal(leftPercentage))
            midTotal.text = String(format: "%.2f", modifyTotal(midPercent))
            rightTotal.text = String(format: "%.2f", modifyTotal(rightPercentage))
        }
        else {
            return
        }
        
    
    }

    @IBAction func calculateTip1(sender: UIButton) {
        if let number = sender.titleLabel?.text{
            print(number)
            calculating += number
            FinalTipLabel.text = calculating
        }
        else {
            return
        }
    }
    
    
    @IBAction func clearTip(sender: UIButton) {
        calculating = ""
        FinalTipLabel.text = "0"
        leftTip.text = "0.00"
        midTip.text = "0.00"
        rightTip.text = "0.00"
        leftTotal.text = "0.00"
        midTotal.text = "0.00"
        rightTotal.text = "0.00"
    }
    //first row for % done
    //2nd row for tip amount for amount of people
    //3rd row for total (check+tip) for amount of people
    
    
   
    
    
}

