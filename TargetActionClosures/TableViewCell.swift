//
//  TableViewCell.swift
//  TargetActionClosures
//
//  Created by Bart Jacobs on 11/02/16.
//  Copyright © 2016 Bart Jacobs. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var mainLabel: UILabel!

    @IBOutlet var button: UIButton!
    @IBOutlet var smartButton: Button!

    override func prepareForReuse() {
        smartButton.didTouchUpInside = nil
    }

}
