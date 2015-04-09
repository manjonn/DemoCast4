//
//  ViewController.swift
//  DemoCast3
//
//  Created by Manjula Jonnalagadda on 3/21/15.
//  Copyright (c) 2015 Manjula Jonnalagadda. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITextFieldDelegate,UITableViewDelegate {
    
    
    @IBOutlet weak var toDoTableView: UITableView!
    
    var items:[String]=[]
    let cellIdentifier="cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell?=tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! UITableViewCell?
        if cell==nil{
            cell=UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }
        cell?.textLabel?.text=items[indexPath.row]
        return cell!
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        items.append(textField.text)
        textField.text=""
        toDoTableView.reloadData()
        return true
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle==UITableViewCellEditingStyle.Delete{
            items.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }


}

