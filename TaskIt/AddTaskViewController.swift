//
//  addTaskViewController.swift
//  TaskIt
//
//  Created by Miroslaw Kucharzyk on 03/01/16.
//  Copyright © 2016 Miroslaw Kucharzyk. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    @IBOutlet weak var taskDateDatePicker: UIDatePicker!
    
    var vc: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createTask(sender: AnyObject) {
        let task:TaskModel = TaskModel(name: self.taskNameTextField.text!, description: self.taskDescriptionTextField.text!, date: taskDateDatePicker.date, completed: false)

        self.vc!.taskArray.append(task)
        
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
