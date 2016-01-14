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
        
        let upGesture = UISwipeGestureRecognizer(target: self, action: "reportVerticalSwipe:")
        upGesture.direction = .Up
        
        let downGesture = UISwipeGestureRecognizer(target: self, action: "reportVerticalSwipe:")
        downGesture.direction = .Down
        
        view.addGestureRecognizer(upGesture)
        view.addGestureRecognizer(downGesture)
        
        let leftGesture = UISwipeGestureRecognizer(target: self, action: "reportHorizontalSwipe:")
        leftGesture.direction = .Left
        
        
        let rightGesture = UISwipeGestureRecognizer(target: self, action: "reportHorizontalSwipe:")
        rightGesture.direction = .Right
        
        view.addGestureRecognizer(leftGesture)
        view.addGestureRecognizer(rightGesture)
    }

    func reportHorizontalSwipe(recognizer: UIGestureRecognizer) {
        label.text = "Horizontal swipe detected"
        resetMessage()
    }
    
    func resetMessage() {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), {
            self.label.text = ""
        })
    }
    
    func reportVerticalSwipe(recognizer: UIGestureRecognizer) {
        label.text = "Vertical swipe detected"
        resetMessage()
    }


}

