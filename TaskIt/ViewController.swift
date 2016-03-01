//
//  ViewController.swift
//  TaskIt
//
//  Created by Miroslaw Kucharzyk on 27/12/15.
//  Copyright © 2015 Miroslaw Kucharzyk. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var fetchedResultsController:NSFetchedResultsController = NSFetchedResultsController()


    override func viewDidLoad() {
        super.viewDidLoad()
        fetchedResultsController = getFetchedResultsController()
        fetchedResultsController.delegate = self
        do {
            try fetchedResultsController.performFetch()
        } catch _ {
            
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
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
        
        let thisTask = fetchedResultsController.objectAtIndexPath(indexPath) as! TaskModel
        
        cell.taskDateLabel.text = Date.toString(thisTask.date!)
        cell.taskDescriptionLabel.text = thisTask.desc
        cell.taskNameLabel.text = thisTask.name
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let sections = fetchedResultsController.sections {
            return sections.count
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections {
            let currentSection = sections[section]
            return currentSection.numberOfObjects
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let thisTask = fetchedResultsController.objectAtIndexPath(indexPath) as! TaskModel
        thisTask.completed = !(thisTask.completed)
        
        (UIApplication.sharedApplication().delegate as! AppDelegate).saveContext()

    }
   
    //NSFetchedResultsControllerDelegate
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }

    //UITableViewDelegate
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(fetchedResultsController.sections?.count == 1) {
            let fetchedObject = fetchedResultsController.fetchedObjects! //force unwrap
            let testTask:TaskModel = fetchedObject[0] as! TaskModel
            if(testTask.completed) {
                return "Completed"
            } else {
                return "To do"
            }
        }
        if(section == 0) {
            return "To do"
        } else {
            return "Completed"
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
   
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.destinationViewController.isKindOfClass(TaskDetailViewController)) {
            let vc:TaskDetailViewController = segue.destinationViewController as! TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            let task = fetchedResultsController.objectAtIndexPath(indexPath) as! TaskModel
            
            vc.task = task
        } else if(segue.destinationViewController.isKindOfClass(AddTaskViewController)) {
            segue.destinationViewController as! AddTaskViewController
        }
    }
    
    func taskFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "TaskModel")
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        let completedDescriptor = NSSortDescriptor(key: "completed", ascending: true)
        fetchRequest.sortDescriptors = [completedDescriptor, sortDescriptor]
        return fetchRequest
    }
    
    func getFetchedResultsController() -> NSFetchedResultsController {
        return NSFetchedResultsController(fetchRequest: self.taskFetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: "completed", cacheName: nil)
    }


}

