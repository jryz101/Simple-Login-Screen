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
        
        
        
    }
    
    
    //Login button action
    @IBAction func loginButton(_ sender: UIButton) {
        
    }
}

