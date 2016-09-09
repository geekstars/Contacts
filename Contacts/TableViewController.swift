//
//  TableViewController.swift
//  Contacts
//
//  Created by Hoàng Minh Thành on 9/9/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var arrayData:NSMutableArray!
    var dictContacts = NSMutableDictionary()
    var arrayKey:NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.sectionIndexColor = UIColor.blueColor()
        arrayData = NSMutableArray()
        for _ in 0..<60 {
            arrayData.addObject(Person())
        }
        
        for element in arrayData {
            let person = element as! Person
            var firstLetter:String = (person.firstName as NSString!).substringToIndex(1)
            
            if firstLetter == "Đ" {
                firstLetter = "D"
            }
            if firstLetter == "Á" {
                firstLetter = "A"
            }
            var arrayForLetter:NSMutableArray!
            
            if dictContacts.valueForKey(firstLetter) != nil {
                arrayForLetter = dictContacts.valueForKey(firstLetter) as! NSMutableArray
                arrayForLetter.addObject(person)
                dictContacts.setValue(arrayForLetter, forKey: firstLetter)
            }
            else
            {
                arrayForLetter = NSMutableArray(objects: person)
                dictContacts.setValue(arrayForLetter, forKey: firstLetter)
            }
        }
        arrayKey = dictContacts.allKeys as! [String]
        arrayKey = arrayKey.sortedArrayUsingSelector(#selector(NSNumber.compare(_:)))
    }

    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayKey[section] as? String
    }
    
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return arrayKey as? [String]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return arrayKey.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let sectionTitle = arrayKey[section]
        let sectionPersons = dictContacts[sectionTitle as! String]
        return (sectionPersons?.count)!
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        }
        let sectionTitle = arrayKey[indexPath.section]
        let sectionPersons = dictContacts[sectionTitle as! String]
        let person = sectionPersons![indexPath.row] as! Person
        cell?.textLabel?.text = person.fullName
        cell?.detailTextLabel?.text = person.phoneNumber
        return cell!
    }
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1.0)
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.blackColor()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = DetailVC()
        
        let sectionTile = arrayKey[indexPath.section]
        let sectionPersons = dictContacts[sectionTile as! String]
        
        let person = sectionPersons![indexPath.row] as! Person
        detailVC.person = person
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
