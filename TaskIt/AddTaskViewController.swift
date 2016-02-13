//
//  addTaskViewController.swift
//  TaskIt
//
//  Created by Miroslaw Kucharzyk on 03/01/16.
//  Copyright © 2016 Miroslaw Kucharzyk. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    @IBOutlet weak var taskDateDatePicker: UIDatePicker!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createTask(sender: AnyObject) {
        
        let appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        let moc = appDelegate.managedObjectContext
        
        let entityDescription = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: moc)
        
        let task = TaskModel(entity: entityDescription!, insertIntoManagedObjectContext: moc)
        task.name = taskNameTextField.text
        task.desc = taskDescriptionTextField.text
        task.date = taskDateDatePicker.date
        task.completed = false
        
        appDelegate.saveContext()
        
        let request = NSFetchRequest(entityName: "TaskModel");

        
        let results: NSArray?
        do {
            results = try moc.executeFetchRequest(request)
        } catch _ {
            results = nil
        }
        
        for result in results! {
            print(result)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
