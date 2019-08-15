//  ViewController.swift
//  Simple Login Screen
//  Created by Jerry Tan on 14/08/2019.
//  Copyright © 2019 Starknet Technologies®. All rights reserved.


import UIKit
import CoreData

class ViewController: UIViewController {
    
    //IB outlets
    @IBOutlet weak var textField : UITextField!
    @IBOutlet weak var label     : UILabel!
    
    
    //Login button
    @IBAction func loginButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newValue = NSEntityDescription.insertNewObject(forEntityName: "UsersDatabase", into: context)
        
        newValue.setValue(textField.text, forKey: "username")
        
        
        
        
        
        //Do try catch construction block for saving user input to coredata model
        do{
            try context.save()
            
            textField.alpha = 0
            
            label.alpha = 1
            
            label.text = "Successfully " + textField.text! + "!"
            
        }catch{
            
            print("Failed to save")
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Cast UIApplication delegate | AppDelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //Create context | The managed object context associated with the main queue (read-only)
        let context = appDelegate.persistentContainer.viewContext
        
        //Create reuqest | A description of search criteria used to retrieve data from a persistent store
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UsersDatabase")
        
        //Return bojects as faults | A Boolean value that indicates whether the objects resulting from a fetch request are faults
        request.returnsObjectsAsFaults = false
        
        
        
        
        
        //Do try catch construction blockvfor fetching username from core database
        do{
            
            let results = try context.fetch(request)
            
            for result in results as! [NSManagedObject] {
                
                if let username = result.value(forKey: "username") as? String {
                    
                    textField.alpha = 0
                    
                    label.alpha = 1
                    
                    label.text = "Login Successfully " + username + "!"
            }
        }
            
        }catch{
            
            print("Request failed")
            
        }
        
    }

}
