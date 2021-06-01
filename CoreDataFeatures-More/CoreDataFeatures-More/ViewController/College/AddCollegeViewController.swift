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

    @IBOutlet weak var imgCollege: UIImageView!
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
            self.imgCollege.image = UIImage(data: (college?.image)!)//
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.selectImage(gesture:)))
        tapGesture.numberOfTouchesRequired = 1
        imgCollege.isUserInteractionEnabled = true
        imgCollege.addGestureRecognizer(tapGesture)
    }
    
    @objc func selectImage(gesture: UITapGestureRecognizer){
       openPhoneGallary()
    }
}

extension AddCollegeViewController:UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func openPhoneGallary(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }

//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        print("Image Upload Cancel.")
//    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        if let img = info[.originalImage] as? UIImage {
            self.imgCollege.image = img
        }
        
    }
}

extension AddCollegeViewController {
   
    @IBAction func saveClicked(_ sender: Any) {
        
        
        if txtCollege.text == "" || txtUniversity.text == "" || txtCity.text == "" {
            print("could not save")
          return
        }
        let _ = self.imgCollege.image?.jpegData(compressionQuality: 0.75)
        guard let pngData = self.imgCollege.image?.pngData() else{return}

        let dict = ["name":txtCollege.text, "university":txtUniversity.text, "city":txtCity.text] as! [String:String]
        if isEdit == true {
            delegate?.editCollegeDetail(dict: dict, index: index)
            DataBaseHelper.sharedinstance.EditCollegeDetail(object: dict, index: index, imageData: pngData)
            isEdit = false
        }else {
            DataBaseHelper.sharedinstance.save(object: dict, imageData: pngData)
        }
        self.navigationController?.popViewController(animated: true)

    }
    
}
