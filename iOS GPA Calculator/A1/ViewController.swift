//
//  ViewController.swift
//  A1
//  GPA Calculator
//
//  Created by Syed Hyder Rizvi on 2/3/17.
//
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    //UI definitions
    @IBOutlet weak var deleteCourseButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var courseName: UITextField!
    @IBOutlet weak var creditsLabel: UITextField!
    
    @IBOutlet weak var MidtermPoint: UITextField!
    @IBOutlet weak var MidtermMax: UITextField!
    @IBOutlet weak var MidtermPercent: UITextField!
    
    
    @IBOutlet weak var AssignmentPoint: UITextField!
    @IBOutlet weak var AssignmentMax: UITextField!
    @IBOutlet weak var AssignmentPercent: UITextField!
    
    @IBOutlet weak var FinalPoint: UITextField!
    @IBOutlet weak var FinalMax: UITextField!
    @IBOutlet weak var FinalPercent: UITextField!
    
    @IBOutlet weak var deleteCourseLabel: UITextField!
    @IBOutlet weak var gpaTotalCalc: UILabel!
    
    @IBOutlet var labels04: [UITextField]!
    
    //global variables
    var gpacalc1:Double = 0.0
    var gpacalcDivide:Double = 0
    var gpacalc = 0.0
    var gpaArray = [Double]()
    var sum:Double = 0.0
    var currentGPA:Double = 0.0
    var testForGPA:Int = 0
    var gpaDeleteRound:Double = 0.0
    var gpppp = 0.0
    
    //function to change UI settings
    func disableHideTextFields(){
        for hideDisableTex in labels04{
            hideDisableTex.isUserInteractionEnabled = false
        }
        deleteCourseLabel.isHidden = false
        
        deleteButton.isHidden = false
        deleteButton.isEnabled = true
    }
    
    //Add course button functionality
    @IBAction func addCourse(_ sender: Any) {
        
        //call to hide UI specifics
        disableHideTextFields()
        
        //variable definition
        var wasChanged1:Bool = false
        var totalScoreForCourse = 0.0
        var roundTotalScoreforCourse = 0.0
        var calcAssignments = 0.0
        var calcMidterm = 0.0
        var calcFinal = 0.0
        gpacalc = Double(gpaTotalCalc.text!) ?? 0
        var gpacalcRound:Double = 0.0
        
        //image declartions
        let gradeAA = "grade_a"
        let grade0 = UIImage(named: gradeAA)
        let imageView0 = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView0.image = grade0
        
        let gradeBB = "grade_b"
        let grade1 = UIImage(named: gradeBB)
        let imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView1.image = grade1
        
        let gradeCC = "grade_c"
        let grade2 = UIImage(named: gradeCC)
        let imageView2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView2.image = grade2
        
        let gradeDD = "grade_d"
        let grade3 = UIImage(named: gradeDD)
        let imageView3 = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView3.image = grade3
        
        let gradeFF = "grade_f"
        let grade4 = UIImage(named: gradeFF)
        let imageView4 = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView4.image = grade4
        
        var totalPercentForCourse = 0.0
        var AssignmentsToDec = 0.0
        var MidtermToDec = 0.0
        var FinalToDec = 0.0
        let creditsCourse = Int(creditsLabel.text!)
        
        if let creditsCourse1 = Int(creditsLabel.text!) {
            if creditsCourse1 < 1 || creditsCourse1 > 8 {
                let alert0 = UIAlertController(title: "Error: Wrong Calculations", message: "Please enter the correct number of credits associated with the class", preferredStyle: .alert)
                let myAction0 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert0.addAction(myAction0)
                present(alert0, animated: true, completion: nil)
            }
            else
            {
                if let title = String(courseName.text!){
                    
                    if(!title.isEmpty){
                        
                        //to receive user assignment text field inputs
                        if let assignmentPt = Double(AssignmentPoint.text!)
                            ,let assignmentMx = Double(AssignmentMax.text!)
                            ,let percent0 = Double(AssignmentPercent.text!){
                            
                            if(assignmentPt > assignmentMx || assignmentPt < 0){
                                
                                let alert0 = UIAlertController(title: "Error: Wrong calculations", message: "Point cannot exceed Max points or drop below 0!", preferredStyle: .alert)
                                let myAction0 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                                alert0.addAction(myAction0)
                                present(alert0, animated: true, completion: nil)
                                
                            }
                            else
                            {
                                let divideAssignments = Double(assignmentPt / assignmentMx)
                                let AssignmentsToWhole = divideAssignments * 100
                                AssignmentsToDec = Double(percent0 / 100)
                                calcAssignments = AssignmentsToWhole * AssignmentsToDec
                            }
                        }
                        else
                        {
                            let alert = UIAlertController(title: "Error: Missing Information", message: "Please provide all fields for Assignments", preferredStyle: .alert)
                            let myAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                            alert.addAction(myAction)
                            present(alert, animated: true, completion: nil)
                        }
                        
                        //to receive user midterm text field inputs
                        if let midtermPt = Double(MidtermPoint.text!)
                            ,let midtermMx = Double(MidtermMax.text!)
                            ,let percent1 = Double(MidtermPercent.text!){
                            
                            if(midtermPt > midtermMx || midtermPt < 0){
                                
                                let alert0 = UIAlertController(title: "Error: Wrong Calculations", message: "Point cannot exceed Max points or drop below 0!", preferredStyle: .alert)
                                let myAction0 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                                alert0.addAction(myAction0)
                                present(alert0, animated: true, completion: nil)
                                
                            }
                            else
                            {
                                
                                let divideMidterm = Double(midtermPt / midtermMx)
                                let midtermToWhole = divideMidterm * 100
                                MidtermToDec = Double(percent1 / 100)
                                calcMidterm = midtermToWhole * MidtermToDec
                                
                            }
                        }
                        else
                        {
                            let alert1 = UIAlertController(title: "Error: Missing Information", message: "Please provide all fields for Midterm", preferredStyle: .alert)
                            let myAction1 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                            alert1.addAction(myAction1)
                            present(alert1, animated: true, completion: nil)
                        }
                        
                        //to receive user finals text field inputs
                        if let finalPt = Double(FinalPoint.text!)
                            ,let finalMx = Double(FinalMax.text!)
                            ,let percent2 = Double(FinalPercent.text!){
                            
                            if(finalPt > finalMx || finalPt < 0){
                                
                                let alert0 = UIAlertController(title: "Error: Wrong calculations", message: "Point cannot exceed Max points or drop below 0!", preferredStyle: .alert)
                                let myAction0 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                                alert0.addAction(myAction0)
                                present(alert0, animated: true, completion: nil)
                                
                            }
                            else
                            {
                                
                                let divideFinal = Double(finalPt / finalMx)
                                let finalToWhole = divideFinal * 100
                                FinalToDec = Double(percent2 / 100)
                                calcFinal = finalToWhole * FinalToDec
                            }
                        }
                        else
                        {
                            let alert2 = UIAlertController(title: "Error: Missing Information", message: "Please provide all fields for Final", preferredStyle: .alert)
                            let myAction2 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                            alert2.addAction(myAction2)
                            present(alert2, animated: true, completion: nil)
                        }
                        
                        let backToPercent0 = AssignmentsToDec * 100
                        let backToPercent1 = MidtermToDec * 100
                        let backToPercent2 = FinalToDec * 100
                        
                        totalPercentForCourse = backToPercent0 + backToPercent1 + backToPercent2
                        if(totalPercentForCourse == 100){
                            totalScoreForCourse = calcAssignments + calcMidterm + calcFinal
                            roundTotalScoreforCourse = round(100*totalScoreForCourse)/100
                            
                            for label:UITextField in labels04 {
                                
                                if (label.text!.characters.count == 0 && wasChanged1 == false)  {
                                    
                                    label.rightViewMode = UITextFieldViewMode.always
                                    
                                    switch totalScoreForCourse {
                                    case 90 ... 100:
                                        label.text = "\(labels04.index(of: label)! + 1)) \(title) | \(creditsCourse!)"
                                        label.rightView = imageView0
                                        label.isHidden = false
                                        gpacalc = 4
                                    case 80 ... 89.99:
                                        label.text = "\(labels04.index(of: label)! + 1)) \(title) | \(creditsCourse!)"
                                        label.rightView = imageView1
                                        label.isHidden = false
                                        gpacalc = 3
                                    case 70 ... 79.99:
                                        label.text = "\(labels04.index(of: label)! + 1)) \(title) | \(creditsCourse!) "
                                        label.rightView = imageView2
                                        label.isHidden = false
                                        gpacalc = 2
                                    case 60 ... 69.99:
                                        label.text = "\(labels04.index(of: label)! + 1)) \(title) | \(creditsCourse!)"
                                        label.rightView = imageView3
                                        label.isHidden = false
                                        gpacalc = 1
                                        
                                    case 50 ... 59.99:
                                        label.text = "\(labels04.index(of: label)! + 1)) \(title) | \(creditsCourse!)"
                                        label.rightView = imageView4
                                        label.isHidden = false
                                        gpacalc = 0
                                        
                                    default:
                                        label.text = "\(labels04.index(of: label)! + 1)) \(title) | \(creditsCourse!)"
                                        label.rightView = imageView4
                                        label.isHidden = false
                                        gpacalc = 0
                                    }
                                    
                                    gpaArray.insert(gpacalc, at: labels04.index(of: label)!)
                                    sum = gpaArray.reduce(0, +)
                                    currentGPA = sum / Double(gpaArray.count)
                                    gpacalc1 = gpacalc1 + gpacalc
                                    gpacalcDivide = gpacalc1 / Double(gpaArray.count)
                                    gpacalcRound = round(1000*currentGPA)/1000
                                    
                                    switch gpacalcRound {
                                    case 3.0 ... 4.0:
                                        gpaTotalCalc.textColor = UIColor.green
                                        gpaTotalCalc.text! = "Cumalative GPA: \(gpacalcRound)"
                                    case 2.0 ... 2.999:
                                        gpaTotalCalc.textColor = UIColor.orange
                                        gpaTotalCalc.text! = "Cumalative GPA: \(gpacalcRound)"
                                    case 0.0 ... 1.999:
                                        gpaTotalCalc.textColor = UIColor.red
                                        gpaTotalCalc.text! = "Cumalative GPA: \(gpacalcRound)"
                                    default:
                                        gpaTotalCalc.textColor = UIColor.white
                                        gpaTotalCalc.text! = "GPA: "
                                        
                                    }
                                    wasChanged1 = true
                                    
                                }
                            }
                            
                        }
                        else{
                            
                            let alert5 = UIAlertController(title: "Error: Wrong calculations", message: "Total percent does not add up to 100", preferredStyle: .alert)
                            let myAction5 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                            alert5.addAction(myAction5)
                            present(alert5, animated: true, completion: nil)
                        }
                        
                    }
                    else
                    {
                        let alert3 = UIAlertController(title: "Error: Missing Information", message: "Please provide the empty field for Title of Course", preferredStyle: .alert)
                        let myAction3 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                        alert3.addAction(myAction3)
                        present(alert3, animated: true, completion: nil)
                    }
                    
                }
            }
        }
        else
        {
            let alert0 = UIAlertController(title: "Error: Missing Information", message: "Please provide the empty field for Credits", preferredStyle: .alert)
            let myAction0 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert0.addAction(myAction0)
            present(alert0, animated: true, completion: nil)
        }
    }
    
    //delete course button functionality
    @IBAction func deleteCourseButton(_ sender: Any) {
        if let deleteLabel:Int = Int(deleteCourseLabel.text!)
        {
            let test = (deleteLabel - 1)
            if deleteLabel < 1 || deleteLabel > 4 || (labels04[test].text == "") || (labels04 == nil) {
                
                let alert = UIAlertController(title: "Error: Wrong Information", message: "Can only delete courses which exist with number ID ranging from 1 - 4", preferredStyle: .alert)
                let myAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert.addAction(myAction)
                present(alert, animated: true, completion: nil)
                
            }
            else
            {
                labels04[test].isHidden = true
                labels04[test].text = ""
                labels04[test].rightView = nil
                
                gpaArray.remove(at: testForGPA)
                
                if(gpaArray.isEmpty)
                {
                    deleteButton.isHidden = true
                    deleteButton.isEnabled = false
                    deleteCourseLabel.isHidden = true
                }
                sum = gpaArray.reduce(0, +)
                
                gpppp = Double(gpaArray.count)
                currentGPA = sum / gpppp
                gpaDeleteRound = round(1000*currentGPA)/1000
                
                switch gpaDeleteRound {
                case 3.0 ... 4.0:
                    gpaTotalCalc.textColor = UIColor.green
                    gpaTotalCalc.text! = "Cumalative GPA: \(gpaDeleteRound)"
                case 2.0 ... 2.999:
                    gpaTotalCalc.textColor = UIColor.orange
                    gpaTotalCalc.text! = "Cumalative GPA: \(gpaDeleteRound)"
                case 0.0 ... 1.999:
                    gpaTotalCalc.textColor = UIColor.red
                    gpaTotalCalc.text! = "Cumalative GPA: \(gpaDeleteRound)"
                default:
                    gpaTotalCalc.textColor = UIColor.white
                    gpaTotalCalc.text! = "GPA: "
                    
                }
            }
            
        }
        else
        {
            let alert1 = UIAlertController(title: "Error: Missing Information", message: "Please provide a number ID for the course to be deleted", preferredStyle: .alert)
            let myAction1 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert1.addAction(myAction1)
            present(alert1, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

