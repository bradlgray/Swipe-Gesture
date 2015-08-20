//
//  ViewController.swift
//  Swipe Gesture
//
//  Created by Brad Gray on 8/18/15.
//  Copyright © 2015 Brad Gray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    let label = UILabel(frame: CGRectMake(self.view.bounds.width / 2 - 100, self.view.bounds.height/2 - 50, 200, 100))
        label.text = "Drag me"
        label.textAlignment = NSTextAlignment.Center
        self.view.addSubview(label)
        
        let gesture = UIPanGestureRecognizer(target: self, action: Selector("wasDragged:"))
        label.addGestureRecognizer(gesture)
        
        label.userInteractionEnabled = true
    
    
    }
    
    func wasDragged(gesture: UIPanGestureRecognizer) {
       
        let translation = gesture.translationInView(self.view)
      
        let label = gesture.view!
        
        label.center = CGPoint(x: self.view.bounds.width / 2 + translation.x, y: self.view.bounds.height / 2 + translation.y)
        
       let xFromCenter = label.center.x - self.view.bounds.width / 2
        
        let scale = min(90 / abs(xFromCenter), 1)
        
        var rotation = CGAffineTransformMakeRotation(xFromCenter / 200)
        
        var stretch = CGAffineTransformScale(rotation, scale, scale)
        
        label.transform = stretch
        
        
        
        if gesture.state == UIGestureRecognizerState.Ended {
            
            if label.center.x < 100 {
                print("not chosen")
            } else if label.center.x > self.view.bounds.width - 100 {
                print("chosen")
            }
            
            rotation = CGAffineTransformMakeRotation(0)
            
            stretch = CGAffineTransformScale(rotation, 1, 1)
            
            label.transform = stretch
            
            label.center = CGPoint(x: self.view.bounds.width / 2 , y: self.view.bounds.height / 2 )
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

