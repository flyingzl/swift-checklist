//
//  ViewController.swift
//  checkList
//
//  Created by zhaolei on 14-6-8.
//  Copyright (c) 2014年 flyingzl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
       
    
    var tableView:UITableView!
    
    var txtField:UITextField!
    
    var tableViewData:String[] = ["Hello", "Guys"]
    
    
    var cellIndentifier = "cellIndentifier"

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //set up textfield
        
        self.txtField = UITextField(frame:CGRectMake(0,0, self.view.bounds.width, 100))
        
        self.txtField.placeholder = "Type task here"
        
        self.txtField.backgroundColor = UIColor.lightGrayColor()
        
        self.txtField.font = UIFont(name:"AvenirNext-Bold", size: 22.0)
        
        self.txtField.textColor = UIColor.whiteColor()
        
        self.txtField.delegate = self;
        
        // set up tableview
        
        self.tableView = UITableView(frame: CGRectMake(0, 100,self.view.bounds.width, self.view.bounds.height - 100 ), style: UITableViewStyle.Plain)
        
        // register tableviewcell, so we can use it later
        
        self.tableView.registerClass(MyTableViewCell.self, forCellReuseIdentifier: cellIndentifier)
        
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        // hide the cell separator line
//        self.tableView.separatorStyle  = UITableViewCellSeparatorStyle.None
    
        self.view.addSubview(self.txtField)
        self.view.addSubview(self.tableView)
        
        
    }
    
    
   func textFieldShouldReturn(textField: UITextField!) -> Bool{
    
    
        self.tableViewData.append( textField.text)
    
        textField.text = ""
    
        //reload tableview data
        self.tableView.reloadData()
    
        // shutdown the keyboard
        textField.resignFirstResponder()
        
        return true
    }
    
    
    // TableView delegate datasource
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
        
        return tableViewData.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIndentifier, forIndexPath: indexPath) as MyTableViewCell
        
        cell.text  = self.tableViewData[indexPath.row]
        
                
        return cell
        
    }
    
    
    // tableview delegate
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath:NSIndexPath){
        
        
        let myCell  = tableView.cellForRowAtIndexPath(indexPath) as MyTableViewCell
        
        
        switch( myCell.accessoryType ){
            
            case UITableViewCellAccessoryType.Checkmark:
        
                myCell.accessoryType = UITableViewCellAccessoryType.None
            
                myCell.detailTextLabel.text = ""
            
            default:
            
                myCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                
                let myDate = NSDate()
                
                let myDateFormatter = NSDateFormatter()
                
                myDateFormatter.dateFormat = "YYYY/mm/dd HH:MM:SS"
                myCell.detailTextLabel.text = myDateFormatter.stringFromDate( myDate )
        
        }
        
   
        
        
    }
    
    



}
