//
//  AddStudentViewController.swift
//  CoreDataFeatures-More
//
//  Created by Reliance on 30/05/21.
//

import UIKit

class AddStudentViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAge: UITextField!
   
    var college : College?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
}

extension AddStudentViewController {
    
    @IBAction func btnSaveClicked(_ sender: Any) {
        
        guard let college = college else {
            return
        }
        
        if txtName.text == "" || txtAge.text == "" {
            print("No text found")
            return
        }else {
            let dict = ["name":txtName.text,"age":txtAge.text] as! [String:String]
            DataBaseHelper.sharedinstance.saveStudentData(object: dict, college: college)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
