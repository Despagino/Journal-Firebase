//
//  EntryVC.swift
//  Journal+Firebase
//
//  Created by Ivan Ramirez on 2/16/22.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var saveButton: IRButton!
    @IBOutlet weak var updateButton: IRButton!
    @IBOutlet weak var fetchAllButton: IRButton!
    @IBOutlet weak var fetchOneButton: IRButton!

    
    private var saveOption = 1
    private var udpateOption = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.verticalGradient()
    }

    //alert controller
    /// Alert that will either save or update a firebase object
    /// - Parameter option: saveOptions is equal to 1 and updateOption is equal to 2
    func presentAlert(updateOrSave option: Int) {
        
        var nameTextField: UITextField?
        var statusTextField: UITextField?
        var objectKeyTextField: UITextField?
        
        let myCustomAlert = AlertController.presentAlertControllerWith(alertTitle: "Employee Details", alertMessage: "Enter in the description", dismissActionTitle: "Cancel")
        
        myCustomAlert.addTextField { itemName in
            itemName.placeholder = "Enter Name"
            nameTextField = itemName
        }
        
        myCustomAlert.addTextField { itemStatus in
            itemStatus.placeholder = "Enter Status"
            statusTextField = itemStatus

        }
        
        myCustomAlert.addTextField { itemKey in
            itemKey.placeholder = "Enter Key"
            objectKeyTextField = itemKey
        }
        
        //add actions
        let saveUpdateItemDetails = UIAlertAction(title: "Continue", style: .default) { _ in
            
            guard let name = nameTextField?.text,
                  !name.isEmpty,
                  let status = statusTextField?.text,
                  let key = objectKeyTextField?.text else {
                      print("\(nameTextField?.text), \(statusTextField?.text), \(objectKeyTextField?.text)")
                      return
                  }
            
            
            // need way to switch between save and update
            if option == self.saveOption {
                EmployeeController.shared.save(name: name, status: status)
            }
            
            if option == self.udpateOption {
                EmployeeController.shared.update(objectKey: key, newName: name, newStatus: status)
            }

            
        }
        
                
        
        myCustomAlert.addAction(saveUpdateItemDetails)
        self.present(myCustomAlert, animated: true, completion: nil)
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        saveButton.shake()
        presentAlert(updateOrSave: saveOption)
    }

    @IBAction func updateButtonTapped(_ sender: Any) {
        updateButton.shake()
        presentAlert(updateOrSave: udpateOption
        )
    }

    @IBAction func fetchAllButtonTapped(_ sender: Any) {
        fetchAllButton.shake()
        EmployeeController.shared.readAll()
    }

    @IBAction func fetchOneButtonTapped(_ sender: Any) {
        fetchOneButton.shake()
        EmployeeController.shared.readEmployee()
    }
}


