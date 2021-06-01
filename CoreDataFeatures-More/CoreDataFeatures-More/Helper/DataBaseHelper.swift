//
//  File.swift
//  CoreDataFeatures-More
//
//  Created by Reliance on 29/05/21.
//

import Foundation
import UIKit
import CoreData

class DataBaseHelper {
    
    static var sharedinstance = DataBaseHelper()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func save(object: [String:String], imageData: Data) {
        
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as! College
        college.name = object["name"]
        college.university = object["university"]
        college.city = object["city"]
        college.image = imageData
        
        do{
            try context.save()
        }catch{
            print("Data Not Saved")
        }
    }
    
    func getCollegeData() -> [College] {
        var college = [College]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "College")
        
        do{
            college = try context.fetch(fetchRequest) as! [College]
        }catch{
           print("Can not get data")
        }
        return college
    }
    
    func EditCollegeDetail(object: [String:String], index: Int, imageData:Data){
        
        let collegeList = getCollegeData()
        collegeList[index].name = object["name"]
        collegeList[index].university = object["university"]
        collegeList[index].city = object["city"]
        collegeList[index].image = imageData
        
        do {
            try context.save()
        } catch  {
            print("Can Not Save")
        }
    }
    
    func saveStudentData(object: [String:String], college:College){
      
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        student.name = object["name"]
        student.age = object["age"]
        student.universities = college
        
        do {
            try context.save()
        } catch  {
            print("can not save")
        }
    }
    
    func getStudentData() -> [Student] {
        var student = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do {
            try student = context.fetch(fetchRequest) as! [Student]
        } catch  {
            print("Error in fetching data")
        }
        return student
    }
    
}
