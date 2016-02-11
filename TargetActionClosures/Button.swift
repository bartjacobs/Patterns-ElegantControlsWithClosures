//
//  Button.swift
//  TargetActionClosures
//
//  Created by Bart Jacobs on 11/02/16.
//  Copyright © 2016 Bart Jacobs. All rights reserved.
//

import UIKit

class Button: UIButton {

    typealias DidTapButton = (Button) -> ()

    var didTouchUpInside: DidTapButton? {
        didSet {
            if didTouchUpInside != nil {
                addTarget(self, action: "didTouchUpInside:", forControlEvents: .TouchUpInside)
            } else {
                removeTarget(self, action: "didTouchUpInside:", forControlEvents: .TouchUpInside)
            }
        }
    }

    // MARK: -
    // MARK: Actions
    func didTouchUpInside(sender: UIButton) {
        if let handler = didTouchUpInside {
            handler(self)
        }
    }

}
