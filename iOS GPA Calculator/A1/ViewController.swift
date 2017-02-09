//
//  ViewController.swift
//  A1
//
//  Created by Syed Hyder Rizvi on 2/3/17.
//  Copyright © 2017 Syed Hyder Rizvi. All rights reserved.
//

import UIKit
weak var courseName: UITextField!

class Assignments{
    
    var ptAssignment:Double
    var mxAssignment:Double
    var percentAssignment:Double
   // var calcAssignments1:Double
    
    init(pt:Double, mx:Double, prcnt:Double){
        self.ptAssignment = pt
        self.mxAssignment = mx
        self.percentAssignment = prcnt
    }
    
    func calculateAssignments()
    {
        let divideAssignments = Double(ptAssignment/mxAssignment)
        let AssignmentsToWhole = divideAssignments * 100
        let AssignmentsToDec = Double(percentAssignment/100)
        let calcAssignments1 = AssignmentsToWhole*AssignmentsToDec
        print(calcAssignments1)
    }
    
    

}
class CourseName{
    var courseTitle:String
    
    init(courseT:String){
        self.courseTitle = courseT
    }
    
    func printCourseT(){
        print(courseTitle)
}
}


//    if let assignmentPt = Double(AssignmentPoint.text!)
//    ,let assignmentMx = Double(AssignmentMax.text!)
//    ,let percent0 = Double(AssignmentPercent.text!) {
//        
//        let divideAssignments = Double(assignmentPt / assignmentMx)
//        let AssignmentsToWhole = divideAssignments * 100
//        AssignmentsToDec = Double(percent0 / 100)
//        calcAssignments = AssignmentsToWhole * AssignmentsToDec
//        print(calcAssignments)
//    }
//    else
//    {
//    let alert = UIAlertController(title: "Error", message: "Did not provide correct numbers for Assignments", preferredStyle: .alert)
//    let myAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//    alert.addAction(myAction)
//    present(alert, animated: true, completion: nil)
//    }

// @IBOutlet var titleB0: UILabel!
// @IBOutlet var titleB1: UILabel!
// @IBOutlet var titleB2: UILabel!
// @IBOutlet var titleB3: UILabel!



class ViewController: UIViewController {
    

    @IBOutlet weak var courseName: UITextField!
    
    
    //@IBOutlet var titleB: UILabel!
    
    @IBOutlet weak var titleB: UITextView!
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
    @IBOutlet var labels: [UILabel]!
    
    @IBOutlet weak var deleteCourseLabel: UITextField!
    
    
    var counterVariable = 0
    var wasChanged = false
    
   // @IBOutlet weak var testing: UITableView!
    
//    func reset(){
//        
//        numberOfTimesClicked = 0
//        
//    }
  
    @IBAction func addCourse(_ sender: Any) {
        var wasChanged1:Bool = false
        var totalScoreForCourse = 0.0
        var roundTotalScoreforCourse = 0.0
        var calcAssignments = 0.0
        var calcMidterm = 0.0
        var calcFinal = 0.0
        
        let creditsCourse = Int(creditsLabel.text!)
        
   //     var numberOfTimesChanged = 0
        var totalPercentForCourse = 0.0
        var AssignmentsToDec = 0.0
        var MidtermToDec = 0.0
        var FinalToDec = 0.0
        
         if let title = String(courseName.text!){
//      while(numberOfTimesClicked < 3 || title.isEmpty){
//        numberOfTimesClicked += 1

       
            if(!title.isEmpty){
//                let iterate1 = iterateNum(arg1: numberOfTimesClicked)
//                print("Number of times clicked ", iterate1, labels)
//        let assignmentPt = Double(AssignmentPoint.text!)
//        let assignmentMx = Double(AssignmentMax.text!)
//            let percent0 = Double(AssignmentPercent.text!)
//        
//            let assignCalc = Assignments(pt: assignmentPt, mx: assignmentMx, prcnt: percent0)
//            assignCalc.calculateAssignments()
//            let assignCourse = CourseName(courseT: title)
//            assignCourse.printCourseT()
           
            if let assignmentPt = Double(AssignmentPoint.text!)
            ,let assignmentMx = Double(AssignmentMax.text!)
                ,let percent0 = Double(AssignmentPercent.text!){
                if(assignmentPt > assignmentMx || assignmentPt < 0){
                    let alert0 = UIAlertController(title: "Error", message: "Point cannot exceed Maximum points or drop below 0!", preferredStyle: .alert)
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
         //   print(calcAssignments)
                
            }
            }
        else
        {
            let alert = UIAlertController(title: "Error", message: "Did not provide correct numbers for Assignments", preferredStyle: .alert)
            let myAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(myAction)
            present(alert, animated: true, completion: nil)
        }
            
    
        if let midtermPt = Double(MidtermPoint.text!)
        ,let midtermMx = Double(MidtermMax.text!)
            ,let percent1 = Double(MidtermPercent.text!){
            if(midtermPt > midtermMx || midtermPt < 0){
                let alert0 = UIAlertController(title: "Error", message: "Point cannot exceed Maximum points or drop below 0!", preferredStyle: .alert)
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
          //  print(calcMidterm)
            
        }
        }
        else
        {
            let alert1 = UIAlertController(title: "Error", message: "Did not provide correct numbers for Midterm", preferredStyle: .alert)
            let myAction1 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert1.addAction(myAction1)
            present(alert1, animated: true, completion: nil)
            }
            
            
        if let finalPt = Double(FinalPoint.text!)
            ,let finalMx = Double(FinalMax.text!)
            ,let percent2 = Double(FinalPercent.text!){
            
            if(finalPt > finalMx || finalPt < 0){
                let alert0 = UIAlertController(title: "Error", message: "Point cannot exceed Maximum points or drop below 0!", preferredStyle: .alert)
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
           // print(calcFinal)
            }
            }
        else
        {
            let alert2 = UIAlertController(title: "Error", message: "Did not provide correct numbers for Final", preferredStyle: .alert)
            let myAction2 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert2.addAction(myAction2)
            present(alert2, animated: true, completion: nil)
            }
            
            let backToPercent0 = AssignmentsToDec * 100
            let backToPercent1 = MidtermToDec * 100
            let backToPercent2 = FinalToDec * 100
            
            totalPercentForCourse = backToPercent0 + backToPercent1 + backToPercent2
//                for label in titleB {
//                if label.text.characters.count == 0 {
//                    label.text = "You got 100%"
//                }
//            }
            if(totalPercentForCourse == 100){
                totalScoreForCourse = calcAssignments + calcMidterm + calcFinal
                roundTotalScoreforCourse = round(100*totalScoreForCourse)/100
              //  titleB.text = String(roundTotalScoreforCourse)
//               
//                labels.append(titleB0)
//                labels.append(titleB1)
//                labels.append(titleB2)
//                labels.append(titleB3)
//                
//                labels[0].text = "hello"
//                labels[1].text = "you"
//                labels[2].text = "fat"
//                labels[3].text = "bastard"
//
//                print(labels[0])
//                print(labels[1])
//                print(labels[2])
//                print(labels[3])
//                
               // titleB0?.text = " Testing "
              //  print(labels[0])
                
                for label:UILabel in labels {
                    if (label.text!.characters.count == 0 && wasChanged1 == false)  {
                        switch totalScoreForCourse {
                        case 90 ... 100:
                            label.text = "\(labels.index(of: label)! + 1)) \(title) | \(creditsCourse!) \(roundTotalScoreforCourse)% \n "
                        case 80 ... 89.99:
                            label.text = "\(labels.index(of: label)! + 1)) \(title) | \(creditsCourse!) \(roundTotalScoreforCourse)% \n"
                        case 70 ... 79.99:
                            label.text = "\(labels.index(of: label)! + 1)) \(title) | \(creditsCourse!) \(roundTotalScoreforCourse)% \n"
                            print("You got a C.")
                        case 60 ... 69.99:
                            label.text = "\(labels.index(of: label)! + 1)) \(title) | \(creditsCourse!)  \(roundTotalScoreforCourse)% \n"
                            print("You got a D. :/")
                        case 50 ... 59.99:
                            label.text = "\(labels.index(of: label)! + 1)) \(title) | \(creditsCourse!) \(roundTotalScoreforCourse)% \n"
                            print("You failed mydude")
                        default:
                            label.text = "\(labels.index(of: label)! + 1)) \(title) | \(creditsCourse!)  \(roundTotalScoreforCourse)% \n"
                            print("WOW! that's a low grade!")
                        }
//                        print("heloooooooooo",  labels[3].text!)

                        wasChanged1 = true
                    }
                }
                if(labels.count > 4){
                    let alert3 = UIAlertController(title: "Error", message: "Max course allowed is 4", preferredStyle: .alert)
                    let myAction3 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    alert3.addAction(myAction3)
                    present(alert3, animated: true, completion: nil)
                }
                
//                switch totalScoreForCourse {
//                case 90 ... 99999:
//                    self.titleB.text = self.titleB.text! + "For \(numberOfTimesClicked). \(title) you got a \(roundTotalScoreforCourse)%, an A \n "
//                //    titleB.background
//                    print("You got an A!")
//                case 80 ... 89.99:
//                    titleB.text = "For \(numberOfTimesClicked). \(title) you got a \(roundTotalScoreforCourse)%, a B \n"
//                    print("You got a B!")
//                case 70 ... 79.99:
//                    self.titleB.text = self.titleB.text! + "For \(numberOfTimesClicked). \(title) you got a \(roundTotalScoreforCourse)%, a C \n"
//                    print("You got a C.")
//                case 60 ... 69.99:
//                    self.titleB.text = self.titleB.text! + "For \(numberOfTimesClicked). \(title) you got a \(roundTotalScoreforCourse)%, a D \n"
//                    print("You got a D. :/")
//                case 50 ... 59.99:
//                   self.titleB.text = self.titleB.text! + "For \(numberOfTimesClicked). \(title) you got a \(roundTotalScoreforCourse)%, a F \n"
//                    print("You failed mydude")
//                default:
//                   self.titleB.text = self.titleB.text! + "For \(numberOfTimesClicked). \(title) you got a way past failing grade! A \(roundTotalScoreforCourse)%! \n"
//                    print("WOW! that's a low grade!")
//                }
            }
            else
            {
                
                let alert3 = UIAlertController(title: "Error", message: "Total percent does not add up to 100", preferredStyle: .alert)
                let myAction3 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert3.addAction(myAction3)
                present(alert3, animated: true, completion: nil)

            }
            
        }
        else
        {
            let alert3 = UIAlertController(title: "Error", message: "No title provided", preferredStyle: .alert)
            let myAction3 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert3.addAction(myAction3)
            present(alert3, animated: true, completion: nil)
        }
        }
//        let iterate = iterateNum(arg1: Double(numberOfTimesClicked))
    }
//}
    
    func iterateNum(arg1: Double) -> Double {
        var numberOfTimesClicked1 = 0
        numberOfTimesClicked1 += 1
        return Double(numberOfTimesClicked1)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
//        labels = [titleB0, titleB1, titleB2, titleB3]

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteCourseButton(_ sender: Any) {
        if let deleteLabel:Int = Int(deleteCourseLabel.text!)
        {
            let test = (deleteLabel - 1)
            print(test)
            if deleteLabel < 1 || deleteLabel > 4 {
                                let alert = UIAlertController(title: "Error", message: "Can only delete courses 1 - 4", preferredStyle: .alert)
                                let myAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                                alert.addAction(myAction)
                                present(alert, animated: true, completion: nil)
                
            }
                else
            {
                
          //  print(testing)
          //   print(labels[deleteLabel].text!)
             labels[test].text = ""
//                let alert = UIAlertController(title: "Deleted", message: "Your course has been deleted", preferredStyle: .alert)
//                let myAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//                alert.addAction(myAction)
//                present(alert, animated: true, completion: nil)

            }
        }
    }
    


}

