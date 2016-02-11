### Elegant Controls With Closures

#### Author: Bart Jacobs

In [yesterday's tutorial](http://bartjacobs.com/references-delegation-and-notifications/), I showed you how to use closures as an alternative to delegate protocols. Closures—or blocks in Objective-C—are incredibly useful and I frequently utilize them as an alternative to existing design patterns. One such pattern is the **target-action** pattern.

## What Is It?

The target-action pattern is one of the most common Cocoa design patterns.

> Target-action is a design pattern in which an object holds the information necessary to send a message to another object when an event occurs. — [iOS Developer Library](https://developer.apple.com/library/ios/documentation/General/Conceptual/Devpedia-CocoaApp/TargetAction.html)

The sending object keeps a reference to the message it needs to send and the object it needs to send the message to. That is how buttons and other Cocoa controls work, for example. Take a look at the following example.

```language-swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!

    // MARK: -
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        button.addTarget(self, action: "didTapButton:", forControlEvents: .TouchUpInside)
    }

    // MARK: -
    // MARK: Actions
    @IBAction func didTapButton(sender: UIButton) {

    }
}
```

In this example, `button` is the sender and `self`, a `ViewController` instance, is the target or receiver. When the button detects a `.TouchUpInside` event, it sends a `didTapButton:` message to the view controller. The result is that the `didTapButton(_:)` action is invoked on the view controller.

The target-action pattern is a transparent mechanism for sending messages to an object when a particular event takes place. This works fine and it has been working fine for years and years. The target-action pattern isn't always the best solution to a problem, though. In some situations you want to have access to the context in which the target was added. Take a look at the following example to better understand what I mean.

```language-swift
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
```

This example is a bit more complex, but it better shows the goal of this tutorial. The `TableViewController` class is a `UITableViewController` subclass. In `tableView(_:cellForRowAtIndexPath:)`, we dequeue a table view cell of type `TableViewCell`. This class has a `button` property of type `UIButton`. We apply the target-action pattern to enable the table view controller to respond to user interaction by adding `self`, the `TableViewController` instance, as a target to the button.

When the user taps the button of the table view cell, the `didTapButton(_:)` method is invoked on the `TableViewController` instance. In the `didTapButton(_:)` action, we obtain a reference to the table view cell of the button. The code we need to accomplish this isn't pretty and it can easily break if Apple decides to refactor the view hierarchy of the `UITableViewCell` class in a future version of UIKit.

**Read this article on the [blog](http://bartjacobs.com/elegant-controls-with-closures/)**.
