//
//  CollegeTableViewCell.swift
//  CoreDataFeatures-More
//
//  Created by Reliance on 29/05/21.
//

import UIKit

class CollegeTableViewCell: UITableViewCell {

    @IBOutlet weak var imgCollege: UIImageView!
    @IBOutlet weak var lblCollegeName: UILabel!
    @IBOutlet weak var lblCollegeUniversity: UILabel!
    @IBOutlet weak var lblCollegeCity: UILabel!
    
    var college : College!{
        didSet{
            lblCollegeName.text = "Name :- \(college.name ?? "")"
            lblCollegeUniversity.text = "University :- \(college.university ?? "")"
            lblCollegeCity.text = "City :- \(college.city ?? "")"
            imgCollege.image = UIImage(data: college.image!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
