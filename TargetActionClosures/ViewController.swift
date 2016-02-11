//
//  ViewController.swift
//  TargetActionClosures
//
//  Created by Bart Jacobs on 11/02/16.
//  Copyright © 2016 Bart Jacobs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        let viewController = self
        button.addTarget(viewController, action: "didTapButton:", forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

