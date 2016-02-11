//
//  TableViewController.swift
//  TargetActionClosures
//
//  Created by Bart Jacobs on 11/02/16.
//  Copyright © 2016 Bart Jacobs. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let tableViewCell = "TableViewCell"

    let items = [ "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen", "Twenty" ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: -
    // MARK: Table View Data Source Methods
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier(tableViewCell, forIndexPath: indexPath) as? TableViewCell {
            // Fetch Item
            let item = items[indexPath.row]

            // Configure Cell
            cell.mainLabel.text = item
            cell.button.addTarget(self, action: "didTapButton:", forControlEvents: .TouchUpInside)

            cell.smartButton.didTouchUpInside = { (sender) in
                print(item)
            }

            return cell
        }

        return UITableViewCell(style: .Default, reuseIdentifier: nil)
    }

    // MARK: -
    // MARK: Actions
    func didTapButton(sender: UIButton) {
        // Fetch Item
        if let superview = sender.superview, let cell = superview.superview as? TableViewCell {
            if let indexPath = tableView.indexPathForCell(cell) {
                let item = items[indexPath.row]
                print(item)
            }
        }
    }

}
