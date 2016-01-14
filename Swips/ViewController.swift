//
//  ViewController.swift
//  Swips
//
//  Created by Xiao Lu on 1/12/16.
//  Copyright © 2016 Xiao Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    private var gestureStartPoint: CGPoint!
    
    private let minimumGestrueLength = Float(5.0)
    private let maximumVariance = Float(5)

    override func viewDidLoad() {
        super.viewDidLoad()

        for var touchCount = 1; touchCount <= 5; touchCount++ {
            let up = UISwipeGestureRecognizer(target: self, action: "reportVerticalSwipe:")
            up.direction = .Up
            up.numberOfTouchesRequired = touchCount
            view.addGestureRecognizer(up)
            
            let down = UISwipeGestureRecognizer(target: self, action: "reportVerticalSwipe:")
            down.direction = .Down
            down.numberOfTouchesRequired = touchCount
            view.addGestureRecognizer(down)
            
            let left = UISwipeGestureRecognizer(target: self, action: "reportHorizontalSwipe:")
            left.direction = .Left
            left.numberOfTouchesRequired = touchCount
            view.addGestureRecognizer(left)
            
            let right = UISwipeGestureRecognizer(target: self, action: "reportHorizontalSwipe:")
            right.direction = .Right
            right.numberOfTouchesRequired = touchCount
            view.addGestureRecognizer(right)
        }
    }
    
    func descriptionForTouchCount(touchCount: Int) -> String {
        switch touchCount {
        case 1:
            return "Single"
        case 2:
            return "Double"
        case 3:
            return "Triple"
        case 4:
            return "Quadruple"
        case 5:
            return "Quintuple"
        default:
            return ""
        }
    }

    func resetMessage() {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), {
            self.label.text = ""
        })
    }
    
    func reportHorizontalSwipe(recognizer: UIGestureRecognizer) {
        let count = descriptionForTouchCount(recognizer.numberOfTouches())
        label.text = "\(count) Horizontal swipe detected"
        resetMessage()
    }
    
    func reportVerticalSwipe(recognizer: UIGestureRecognizer) {
        let count = descriptionForTouchCount(recognizer.numberOfTouches())
        label.text = "\(count) Vertical swipe detected"
        resetMessage()
    }

}

