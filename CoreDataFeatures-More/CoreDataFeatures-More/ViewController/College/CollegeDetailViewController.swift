//
//  CollegeDetailViewController.swift
//  CoreDataFeatures-More
//
//  Created by Reliance on 29/05/21.
//

import UIKit

class CollegeDetailViewController: UITableViewController, EditCollegeDelegate {
   
    
   

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lbluniversity: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblStudents: UILabel!
    
    var college: College?
    var student =  [Student]()
    
    var index = Int()
    override func viewDidLoad() {
        super.viewDidLoad()

        lblName.text = "Name: \(college?.name ?? "")"
        lbluniversity.text = "University: \(college?.university ?? "")"
        lblCity.text = "City: \(college?.city ?? "")"
    }
    
  
    override func viewWillAppear(_ animated: Bool)  {
        super.viewWillAppear(true)
        if college?.students?.allObjects != nil{
            student = college?.students?.allObjects as! [Student]
        }
        //DataBaseHelper.sharedinstance.getStudentData()
        lblStudents.text = "Students: \(student.count)"

    }

    func editCollegeDetail(dict: [String : String], index: Int) {
        lblName.text = "Name: \(dict["name"] ?? "")"
        lbluniversity.text = "University: \(dict["university"] ?? "")"
        lblCity.text = "City: \(dict["city"] ?? "")"
        lblStudents.text = "Students: \(student.count)"
    }
    
    @IBAction func btnEditClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "College", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "AddCollegeViewController") as! AddCollegeViewController
        vc.college = college
        vc.isEdit = true
        vc.index = index
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
   

}

extension CollegeDetailViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "StudentListViewController") as! StudentListViewController
            vc.college = college
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
