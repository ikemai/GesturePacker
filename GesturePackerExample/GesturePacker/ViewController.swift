//
//  ViewController.swift
//  GesturePacker
//
//  Created by ikemai on 09/09/2015.
//  Copyright (c) 2015 ikemai. All rights reserved.
//

import UIKit
import GesturePacker

class ViewController: UIViewController {
    
    @IBOutlet weak var dragView: UIView!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var summaryLabelView: UILabel!
    
    private let tapColor = UIColor.redColor()
    private let dragColor = UIColor.grayColor()
    private let statusColor = UIColor.magentaColor()
    private let pinchColor = UIColor.blueColor()
    private let swipColor = UIColor.orangeColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Tap
        view.gesture.tapHandler = {[weak self] tapGesture in
            if let me = self {
                me.view.backgroundColor = me.tapColor
                me.labelView.text = "Tap Gesture"
                me.summaryLabelView.text = "\(tapGesture)"
            }
        }
        
        // Double tap
        view.gesture.doubleTapHandler = {[weak self] tapGesture in
            if let me = self {
                me.view.backgroundColor = me.tapColor
                me.labelView.text = "Double Tap Gesture"
                me.summaryLabelView.text = "\(tapGesture)"
            }
        }
        
        // Triple tap
        view.gesture.tripleTapHandler = {[weak self] tapGesture in
            if let me = self {
                me.view.backgroundColor = me.tapColor
                me.labelView.text = "Triple Tap Gesture"
                me.summaryLabelView.text = "\(tapGesture)"
            }
        }
        
        // Drag
        dragView.gesture.dragHandler = {[weak self] gesture in
            if let me = self {
                me.view.backgroundColor = me.dragColor
                me.labelView.text = "Dragging"
                me.dragView.frame.origin = gesture.translationInView(me.dragView)
                me.summaryLabelView.text = ""
            }
        }
        
        // Pinching
        view.gesture.pinchHandler = {[weak self] pinchGesture in
            if let me = self {
                me.view.backgroundColor = me.pinchColor
                me.labelView.text = "Pinching Gesture"
                me.summaryLabelView.text = "\(pinchGesture)"
            }
        }
        
        // Pinch in
        view.gesture.pinchInHandler = {[weak self] pinchGesture in
            if let me = self {
                me.view.backgroundColor = me.pinchColor
                me.labelView.text = "Pinch In Gesture"
                me.summaryLabelView.text = "\(pinchGesture)"
            }
        }
        
        // Pinch out
        view.gesture.pinchOutHandler = {[weak self] sendar in
            if let me = self {
                me.view.backgroundColor = me.pinchColor
                me.labelView.text = "Pinch Out Gesture"
                me.summaryLabelView.text = "\(sendar)"
            }
        }
        
        // Swip to up
        view.gesture.swipToUpHandler = {[weak self] sendar in
            if let me = self {
                me.view.backgroundColor = me.swipColor
                me.labelView.text = "Swip To Up Gesture"
                me.summaryLabelView.text = "\(sendar)"
            }
        }
        
        // Swip to down
        view.gesture.swipToDownHandler = {[weak self] sendar in
            if let me = self {
                me.view.backgroundColor = me.swipColor
                me.labelView.text = "Swip To Down Gesture"
                me.summaryLabelView.text = "\(sendar)"
            }
        }
        
        // Swip to left
        view.gesture.swipToLeftHandler = {[weak self] sendar in
            if let me = self {
                me.view.backgroundColor = me.swipColor
                me.labelView.text = "Swip To Left Gesture"
                me.summaryLabelView.text = "\(sendar)"
            }
        }
        
        // Swip to right
        view.gesture.swipToRightHandler = {[weak self] sendar in
            if let me = self {
                me.view.backgroundColor = me.swipColor
                me.labelView.text = "Swip To Right Gesture"
                me.summaryLabelView.text = "\(sendar)"
            }
        }
        
        dragView.layer.cornerRadius = dragView.bounds.width / 2
        resetButton.layer.cornerRadius = resetButton.bounds.width / 2
        dragView.layer.borderWidth = 1.0
        resetButton.layer.borderWidth = 1.0
        dragView.layer.borderColor = UIColor.whiteColor().CGColor
        resetButton.layer.borderColor = UIColor.whiteColor().CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didDownResetButton(sender: AnyObject) {
        view.gesture.removeGestures()
        view.gesture.removeHandlers()
        dragView.gesture.removeGestures()
        dragView.gesture.removeHandlers()
    }
}

