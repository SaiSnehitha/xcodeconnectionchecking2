//
//  ViewController.swift
//  IOSApplicationtest2
//
//  Created by Sai Snehitha Bhatta on 19/10/21.
//

import UIKit

class ViewController: UIViewController {

    //radio button variables
    @IBOutlet weak var bachelors: UIButton!
    @IBOutlet weak var diploma: UIButton!
    @IBOutlet weak var highSchool: UIButton!
    
    //check box variables
    @IBOutlet weak var swift: UIButton!
    @IBOutlet weak var java: UIButton!
    @IBOutlet weak var php: UIButton!
    @IBOutlet weak var python: UIButton!
    @IBOutlet weak var cc: UIButton!
    
    //experience textfield
    @IBOutlet weak var experience: UITextField!
    
    //salary lables
    @IBOutlet weak var biWeekly: UILabel!
    @IBOutlet weak var salary: UILabel!
    
    //action button
    @IBOutlet weak var estSalary: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bachelors.isSelected=true
    }
    
    // to calculate salary based on qualification
    func salaryEstimate()->Double{
        if bachelors.isSelected{
            sal=55000
            salary.text=String(sal)
            return sal
        }
        else if diploma.isSelected{
            sal=47000
            salary.text=String(sal)
            return sal
        }
        else if highSchool.isSelected{
            sal=40000
            salary.text=String(sal)
            return sal
        }
        return sal
    }

    var sal=0.0
    var total=0.0
    var selectedLanguage=0
    
    
    //action buttons
    @IBAction func bacchelorsChoose(_ sender: Any) {
        bachelors.isSelected=true
        diploma.isSelected=false
        highSchool.isSelected=false
    }
    @IBAction func diplomaChoose(_ sender: Any) {
        bachelors.isSelected=false
        diploma.isSelected=true
        highSchool.isSelected=false
    }
    @IBAction func highSchoolChoose(_ sender: Any) {
        bachelors.isSelected=false
        diploma.isSelected=false
        highSchool.isSelected=true
    }
    
    // combining all checkboxes as one action and calculating the number of checkbox ticked
    @IBAction func anyLanguage(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected=false
            selectedLanguage-=1
        }
        else{
            sender.isSelected=true
            selectedLanguage+=1
        }
    }
    
   // extimate salary button to make calculations.
    @IBAction func estSalary(_ sender: Any) {
        let t = salaryEstimate()
        let c = t + Double(selectedLanguage)*3000
        let exp = Double(experience.text!)!
        if exp > 4{
            total = c+10000
            let tt=total/26
            salary.text = String(format: "%.2f", total)
            biWeekly.text = String(format: "%.2f", tt)
        }
        else{
            total=c
            let tt=total/26
            salary.text = String(format: "%.2f", total)
            biWeekly.text = String(format: "%.2f", tt)
        }
        
    
    }
    
}

