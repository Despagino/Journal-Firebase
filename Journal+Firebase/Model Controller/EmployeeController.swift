//
//  EmployeeController.swift
//  Journal+Firebase
//
//  Created by Ivan Ramirez on 2/16/22.
//

import Foundation
import Firebase

struct EmployeeController {

    
    static let shared = EmployeeController()
    let dbRes = Database.database().reference()

    //MARK: - Save
        
    func save(name: String, status: String) {
        dbRes.childByAutoId().setValue(["name": "\(name)", "status": "\(status)"])
    }

    //MARK: - read all (fetch all)
    
    func readAll() {
        dbRes.observeSingleEvent(of: .value) { snapShot in
            
            guard let dictionary = snapShot.value as? [String: [String: Any]] else {
                print("Error reading all items")
                return
            }
            
            print(dictionary.values.description)
            
            Array(dictionary.values).forEach {
                let name = $0["name"] as? String ?? ""
                let status = $0["status"] as? String ?? ""
                print(name, status)
                
            }
        }
    }
    

    //MARK: - read (fetch one)
    
    func readEmployee() {
        dbRes.child("employee").observeSingleEvent(of: .value) { snapshot in
            let employeeData = snapshot.value as? [String: Any]
            print(employeeData ?? "No data was able to be read")
        }
    }
    

    //MARK: - Update
    func update(objectKey: String, newName: String, newStatus: String) {
        dbRes.child("\(objectKey)/name").setValue(newName)
        dbRes.child("\(objectKey)/status").setValue(newStatus)
    }
    
    
}
