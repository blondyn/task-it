//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Miroslaw Kucharzyk on 30/12/15.
//  Copyright © 2015 Miroslaw Kucharzyk. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    @IBOutlet weak var taskNameLabel: UITextField!
    @IBOutlet weak var taskDescriptionLabel: UITextField!
    @IBOutlet weak var taskDatePicker: UIDatePicker!
    var task: TaskModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(task)
        self.taskNameLabel.text = self.task.name
        self.taskDescriptionLabel.text = self.task.description
        self.taskDatePicker.date = self.task.date
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
