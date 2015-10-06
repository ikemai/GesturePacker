//
//  GesturePacker.swift
//  GesturePacker
//
//  Created by Mai Ikeda on 2015/09/09.
//  Copyright (c) 2015年 mai_ikeda. All rights reserved.
//

import UIKit

public class GesturePacker {
  
    // Tap
    public var tapHandler: ((UITapGestureRecognizer) -> Void)? { didSet { didTapGesture() } }
    public var doubleTapHandler: ((UITapGestureRecognizer) -> Void)? { didSet { didDoubleTapGesture() } }
    public var tripleTapHandler: ((UITapGestureRecognizer) -> Void)? { didSet { didTripleTapGesture() } }
    // Drag
    public var dragHandler: ((UIPanGestureRecognizer) -> Void)? { didSet { didDragGesture() } }
    // Pinch
    public var pinchHandler: ((UIPinchGestureRecognizer) -> Void)? { didSet { didPinchGesture() } }
    public var pinchInHandler: ((UIPinchGestureRecognizer) -> Void)? { didSet { didPinchInGesture() } }
    public var pinchOutHandler: ((UIPinchGestureRecognizer) -> Void)? { didSet { didPinchOutGesture() } }
    // Swip
    public var swipToLeftHandler: ((UIGestureRecognizer) -> Void)? { didSet { swipToLeftGesture() } }
    public var swipToRightHandler: ((UIGestureRecognizer) -> Void)? { didSet { swipToRightGesture() } }
    public var swipToUpHandler: ((UIGestureRecognizer) -> Void)? { didSet { swipToUpGesture() } }
    public var swipToDownHandler: ((UIGestureRecognizer) -> Void)? { didSet { swipToDownGesture() } }
    
    private var gestures = NSHashTable.weakObjectsHashTable()
    private weak var pinchGesture: UIPinchGestureRecognizer?
    
    private weak var view: UIView?
    
    
    init(view: UIView) {
        self.view = view
    }
}

//
// MARK:- All gestures or handlers is reset
// * It is not the thing which you must call by always *
//
extension GesturePacker {
    
    public func removeGestures() {
        for object in gestures.allObjects {
            if let gesture = object as? UIGestureRecognizer {
                view?.removeGestureRecognizer(gesture)
            }
        }
    }
    
    public func removeHandlers() {
        tapHandler = nil
        doubleTapHandler = nil
        tripleTapHandler = nil
        dragHandler = nil
        pinchHandler = nil
        pinchInHandler = nil
        pinchOutHandler = nil
        swipToLeftHandler = nil
        swipToRightHandler = nil
        swipToUpHandler = nil
        swipToDownHandler = nil
    }
}

//
// MARK:- Set gesture
//
extension GesturePacker {
    
    private func didTapGesture() {
        if tapHandler == nil { return }
        let gesture = UITapGestureRecognizer(target: self, action: "tapGestureRecognizerEvent:")
        view?.addGestureRecognizer(gesture)
        gestures.addObject(gesture)
    }
    
    private func didDoubleTapGesture() {
        if doubleTapHandler == nil { return }
        let gesture = UITapGestureRecognizer(target: self, action: "doubleTapGestureRecognizerEvent:")
        gesture.numberOfTapsRequired = 2
        view?.addGestureRecognizer(gesture)
        gestures.addObject(gesture)
    }
    private func didTripleTapGesture() {
        if tripleTapHandler == nil { return }
        let gesture = UITapGestureRecognizer(target: self, action: "tripleTapGestureRecognizerEvent:")
        gesture.numberOfTapsRequired = 3
        view?.addGestureRecognizer(gesture)
        gestures.addObject(gesture)
    }
    
    private func didDragGesture() {
        if dragHandler == nil { return }
        let gesture = UIPanGestureRecognizer(target: self, action: "panGestureRecognizerEvent:")
        view?.addGestureRecognizer(gesture)
        gestures.addObject(gesture)
    }
    
    private func didPinchGesture() {
        if pinchHandler == nil { return }
        setPinchGesture("didPinchGestureRecognizerEvent:")
    }
    
    private func didPinchInGesture() {
        if pinchInHandler == nil { return }
        setPinchGesture("pinchGestureRecognizerEvent:")
    }
    
    private func didPinchOutGesture() {
        if pinchOutHandler == nil { return }
        setPinchGesture("pinchGestureRecognizerEvent:")
    }
    
    private func setPinchGesture(action: Selector) {
        if pinchGesture != nil {
            pinchGesture?.addTarget(self, action: action)
            return
        }
        let gesture = UIPinchGestureRecognizer(target: self, action: action)
        view?.addGestureRecognizer(gesture)
        pinchGesture = gesture
        gestures.addObject(gesture)
    }
    
    private func swipToLeftGesture() {
        if swipToLeftHandler == nil { return }
        let gesture = UISwipeGestureRecognizer(target: self, action: "swipToLeftGestureRecognizerEvent:")
        gesture.direction = UISwipeGestureRecognizerDirection.Left
        view?.addGestureRecognizer(gesture)
        gestures.addObject(gesture)
    }
    
    private func swipToRightGesture() {
        if swipToRightHandler == nil { return }
        let gesture = UISwipeGestureRecognizer(target: self, action: "swipToRightGestureRecognizerEvent:")
        gesture.direction = UISwipeGestureRecognizerDirection.Right
        view?.addGestureRecognizer(gesture)
        gestures.addObject(gesture)
    }
    
    private func swipToUpGesture() {
        if swipToUpHandler == nil { return }
        let gesture = UISwipeGestureRecognizer(target: self, action: "swipToUpGestureRecognizerEvent:")
        gesture.direction = UISwipeGestureRecognizerDirection.Up
        view?.addGestureRecognizer(gesture)
        gestures.addObject(gesture)
    }
    
    private func swipToDownGesture() {
        if swipToDownHandler == nil { return }
        let gesture = UISwipeGestureRecognizer(target: self, action: "swipToDownGestureRecognizerEvent:")
        gesture.direction = UISwipeGestureRecognizerDirection.Down
        view?.addGestureRecognizer(gesture)
        gestures.addObject(gesture)
    }
}

//
// MARK:- Protocol
//
extension GesturePacker {
    
    @IBAction func tapGestureRecognizerEvent(gesture: UITapGestureRecognizer) {
        tapHandler?(gesture)
    }
    
    @IBAction func doubleTapGestureRecognizerEvent(gesture: UITapGestureRecognizer) {
        doubleTapHandler?(gesture)
    }
    
    @IBAction func tripleTapGestureRecognizerEvent(gesture: UITapGestureRecognizer) {
        tripleTapHandler?(gesture)
    }
    
    @IBAction func panGestureRecognizerEvent(gesture: UIPanGestureRecognizer) {
        if gesture.minimumNumberOfTouches == 1 {
            dragHandler?(gesture)
        }
    }
    
    @IBAction func didPinchGestureRecognizerEvent(gesture: UIPinchGestureRecognizer) {
        pinchHandler?(gesture)
    }
    
    @IBAction func pinchGestureRecognizerEvent(gesture: UIPinchGestureRecognizer) {
        let firstPoint = gesture.scale
        let secondPoint = gesture.velocity
        
        if firstPoint < secondPoint {
            pinchOutHandler?(gesture)
        } else {
            pinchInHandler?(gesture)
        }
    }
    
    @IBAction func swipToLeftGestureRecognizerEvent(gesture: UIGestureRecognizer) {
        swipToLeftHandler?(gesture)
    }
    
    @IBAction func swipToRightGestureRecognizerEvent(gesture: UIGestureRecognizer) {
        swipToRightHandler?(gesture)
    }
    
    @IBAction func swipToUpGestureRecognizerEvent(gesture: UIGestureRecognizer) {
        swipToUpHandler?(gesture)
    }
    
    @IBAction func swipToDownGestureRecognizerEvent(gesture: UIGestureRecognizer) {
        swipToDownHandler?(gesture)
    }
}

//
// MARK:- UIView extension
//
var gestureAssociationKey = "gesturePackerAssociation"

public extension UIView {
    
    public var gesture: GesturePacker {
        get {
            if let instance = objc_getAssociatedObject(self, &gestureAssociationKey) as? GesturePacker {
                return instance
            }
            let instance = GesturePacker(view: self)
            objc_setAssociatedObject(self, &gestureAssociationKey, instance, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return instance
        }
    }
}