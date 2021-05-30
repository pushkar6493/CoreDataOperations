//
//  StudentListViewController.swift
//  CoreDataFeatures-More
//
//  Created by Reliance on 29/05/21.
//

import UIKit

class StudentListViewController: UIViewController {

    @IBOutlet weak var studentTableView: UITableView!
    var student = [Student]()
    var college: College?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if college?.students?.allObjects != nil {
            student = college?.students?.allObjects as! [Student]
        }
        //self.student = DataBaseHelper.sharedinstance.getStudentData()
        self.studentTableView.reloadData()
       
    }
    
    @IBAction func btnAddClicked(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Student", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "AddStudentViewController") as! AddStudentViewController
        vc.college = college
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension StudentListViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Name: \(student[indexPath.row].name ?? "")"
        cell.detailTextLabel?.text = "Age: \(student[indexPath.row].age ?? "")"

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "College", bundle: nil)
//        let vc = storyboard.instantiateViewController(identifier: "CollegeDetailViewController") as! CollegeDetailViewController
//        //vc.college = college[indexPath.row]
//        vc.index = indexPath.row
//
//        self.navigationController?.pushViewController(vc, animated: true)
//
//    }
}

