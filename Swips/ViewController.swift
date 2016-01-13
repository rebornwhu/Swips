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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        gestureStartPoint = touch?.locationInView(self.view)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let currentPosition = touch!.locationInView(self.view)
        
        let deltaX = fabsf(Float(gestureStartPoint.x - currentPosition.x))
        let deltaY = fabsf(Float(gestureStartPoint.y - currentPosition.y))
        
        if deltaX >= minimumGestrueLength && deltaY <= maximumVariance {
            label.text = "Horizontal swipe detected"
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), {
                self.label.text = ""
            })
        }
        else if deltaY >= minimumGestrueLength && deltaX <= maximumVariance {
            label.text = "Vertical swipe detected"
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), {
                self.label.text = ""
            })
        }
    }


}

