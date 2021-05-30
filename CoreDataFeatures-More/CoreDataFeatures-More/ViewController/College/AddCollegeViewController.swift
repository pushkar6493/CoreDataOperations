//
//  AddCollegeViewController.swift
//  CoreDataFeatures-More
//
//  Created by Reliance on 29/05/21.
//

import UIKit

protocol EditCollegeDelegate {
    func editCollegeDetail(dict: [String:String],index:Int)
}

class AddCollegeViewController: UIViewController {

    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtUniversity: UITextField!
    @IBOutlet weak var txtCollege: UITextField!

    var college: College?
    var delegate: EditCollegeDelegate!
    var isEdit = false
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isEdit == true {
            txtCollege.text = college?.name
            txtUniversity.text = college?.university
            txtCity.text = college?.city
        }
        
    }
}

extension AddCollegeViewController {
   
    @IBAction func saveClicked(_ sender: Any) {
        
        if txtCollege.text == "" || txtUniversity.text == "" || txtCity.text == "" {
            print("could not save")
          return
        }
        
        let dict = ["name":txtCollege.text, "university":txtUniversity.text, "city":txtCity.text] as! [String:String]
        if isEdit == true {
            delegate?.editCollegeDetail(dict: dict, index: index)
            DataBaseHelper.sharedinstance.EditCollegeDetail(object: dict, index: index)
            isEdit = false
        }else {
            DataBaseHelper.sharedinstance.save(object: dict)
        }
        self.navigationController?.popViewController(animated: true)

    }
    
}
