//
//  ViewController.swift
//  TaskIt
//
//  Created by Miroslaw Kucharzyk on 27/12/15.
//  Copyright © 2015 Miroslaw Kucharzyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    //section == 0 == task(false) == "To do"
    //section == 1 == task(true) == "completed"

    let taskStates: Dictionary<Int, (state: Bool, header: String)> = [
        0: (state: false, header: "To do"),
        1: (state: true, header: "Completed")
    ]

    var taskArray: [TaskModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let date1 = Date.from(year: 2014, month: 01, day: 01)
        let date2 = Date.from(year: 2014, month: 02, day: 11)
        let date3 = Date.from(year: 2014, month: 03, day: 21)
        
        let task1:TaskModel = TaskModel(name: "Study French", description: "Verbs", date: date1, completed: false)
        let task2:TaskModel = TaskModel(name:  "Eat Dinner", description: "Burgers", date: date2, completed: false)
        let task3:TaskModel = TaskModel(name:  "Gym", description: "Leg day", date: date3, completed: true)
        taskArray = [task1, task2, task3]

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        taskArray = taskArray.sort { (a:TaskModel, b:TaskModel) -> Bool in
            a.date.timeIntervalSince1970 < b.date.timeIntervalSince1970
        }
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAddTaskViewController(sender: AnyObject) {
        self.performSegueWithIdentifier("showAddTask", sender: self)
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TaskCell
        let tasks: [TaskModel]
        tasks = taskFilter{ $0.completed == self.taskStates[indexPath.section]!.state }

        let task: TaskModel = tasks[indexPath.row]
        cell.taskNameLabel.text = task.name
        cell.taskDescriptionLabel.text = task.description
        cell.taskDateLabel.text = Date.toString(task.date)
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return completedCount(self.taskStates[section]!.state)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

    }

    //UITableViewDelegate
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return taskStates[section]!.header
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
   
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.destinationViewController.isKindOfClass(TaskDetailViewController)) {
            let vc:TaskDetailViewController = segue.destinationViewController as! TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            vc.task = taskFilter{$0.completed == self.taskStates[indexPath.section]!.state}[indexPath.row]
        } else if(segue.destinationViewController.isKindOfClass(AddTaskViewController)) {
            let vc:AddTaskViewController = segue.destinationViewController as! AddTaskViewController
            vc.vc = self
        }
    }
    
    //helpers
    func completedCount(variant: Bool) -> Int{
        return taskFilter({
            (task: TaskModel) -> Bool in
            return task.completed == variant
        }).count
    }
    
    func taskFilter(f: (TaskModel)->Bool) -> [TaskModel] {
        return self.taskArray.filter {
            (task:TaskModel) -> Bool in
            return f(task)
        }
    }


}

