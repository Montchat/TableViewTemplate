//
//  TableViewController.swift
//  TableViewTemplate
//
//  Created by Joe E. on 2/16/16.
//  Copyright © 2016 Joe Edwards. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let tableViewDictionary = [
        
        ["name" : "Section 1", "cells" : ["Section 1 Cell", "cell 2", "cell 3", "cell 4"] ],
        ["name" : "Section 2", "cells" : ["cell 1", "Section 2 Cell", "cell 3", "cell 4"] ],
        ["name" : "Section 3", "cells" : ["cell 1", "cell2", "Section 3 Cell", "cell4"] ]
        
    ]
    
    struct Objects { var sectionName: String! ; var sectionObjects: [String]! }
    
    var objectArray = [Objects]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for object in tableViewDictionary {
            guard let section = object["name"] as? String else { return } ; guard let cells = object["cells"] as? [String] else { return }
            
            objectArray.append(Objects(sectionName: section, sectionObjects: cells))
            
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return objectArray.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return objectArray[section].sectionObjects.count
        
    }
    
    override func tableView(tableView: UITableView, didEndEditingRowAtIndexPath indexPath: NSIndexPath) {
//        tableView.reloadData()
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.font = UIFont.systemFontOfSize(18)
        cell.textLabel?.text = objectArray[indexPath.section].sectionObjects[indexPath.row] // look at this

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


//     Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            
        }
        
        
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60))
        header.backgroundColor = UIColor(red: 1, green: 0.97, blue: 0.57, alpha: 0.66)
        
        let label = UILabel(frame: CGRect(x: header.frame.origin.x, y: header.frame.origin.y, width: header.frame.width, height: header.frame.height))
        label.text = objectArray[section].sectionName
        label.textAlignment = .Center ; label.textColor = UIColor(white: 0, alpha: 0.66)
        label.font = UIFont.systemFontOfSize(18, weight: UIFontWeightMedium)
        header.addSubview(label)
        
        return header
        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectArray[section].sectionName
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 60
        
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
