//
//  InboxTableViewController.swift
//  mc taskforce mobile cloudpage
//
//  Created by 楊野勇智 on 2016/01/17.
//  Copyright © 2016年 salesforce.com. All rights reserved.
//

import UIKit

class InboxTableViewController: UITableViewController {
    
    @IBOutlet var inboxTable: UITableView!
    var etdataSource = ExactTargetEnhancedPushDataSource()
    var selectedMessage : ETMessage?

    override func viewDidLoad() {
        super.viewDidLoad()
        // cellの表示を自分で調整したいため下記のようには指定しない。（DataSourceはStoryBoardでこのクラスを指定済み）
        //self.inboxTable.dataSource = self.etdataSource
        self.etdataSource.inboxTableView = self.inboxTable
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.etdataSource.messages != nil ? self.etdataSource.messages.count : 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("et_inbox_cell", forIndexPath: indexPath)

        if let message = self.etdataSource.messages[indexPath.row] as? ETMessage {
            cell.textLabel?.text = message.messageName
            cell.detailTextLabel?.text = message.siteUrlAsString
        }

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let message = self.etdataSource.messages[indexPath.row] as? ETMessage {
            self.selectedMessage = message
            message.markAsRead()
            
            // 下記のメソッドを行うと二度と表示されなくなる
            // もう表示したくない場合に行う
            //message.markAsDeleted()
            
            if let nextVc = self.storyboard?.instantiateViewControllerWithIdentifier("cloudpage") as? CloudPageViewController {
                nextVc.message = self.selectedMessage
                self.navigationController?.pushViewController(nextVc, animated: true)
            }
        }
    }

}
