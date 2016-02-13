//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Miroslaw Kucharzyk on 30/12/15.
//  Copyright © 2015 Miroslaw Kucharzyk. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    @IBOutlet weak var taskDatePicker: UIDatePicker!
    var task: TaskModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(task)
        self.taskNameTextField.text = self.task.name
        self.taskDescriptionTextField.text = self.task.desc
        self.taskDatePicker.date = self.task.date!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        
//        let appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
//        
//        task.name = self.taskNameTextField.text
//        task.desc = self.taskDescriptionTextField.text
//        task.date = self.taskDatePicker.date
//        
//        appDelegate.saveContext()
//        
//        self.navigationController?.popViewControllerAnimated(true)
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
