//
//  CollegeListViewController.swift
//  CoreDataFeatures-More
//
//  Created by Reliance on 29/05/21.
//

import UIKit

class CollegeListViewController: UIViewController {

   
    @IBOutlet weak var collegeTableView: UITableView!
    var college = [College]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "College List"
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        college = DataBaseHelper.sharedinstance.getCollegeData()
        self.collegeTableView.reloadData()

    }
}

extension CollegeListViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return college.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeTableViewCell", for: indexPath) as! CollegeTableViewCell
        cell.college = college[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "College", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "CollegeDetailViewController") as! CollegeDetailViewController
        vc.college = college[indexPath.row]
        vc.index = indexPath.row
       
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
