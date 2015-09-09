# GesturePacker

[![CI Status](http://img.shields.io/travis/ikemai/GesturePacker.svg?style=flat)](https://travis-ci.org/ikemai/GesturePacker)
[![Version](https://img.shields.io/cocoapods/v/GesturePacker.svg?style=flat)](http://cocoapods.org/pods/GesturePacker)
[![License](https://img.shields.io/cocoapods/l/GesturePacker.svg?style=flat)](http://cocoapods.org/pods/GesturePacker)
[![Platform](https://img.shields.io/cocoapods/p/GesturePacker.svg?style=flat)](http://cocoapods.org/pods/GesturePacker)

GesturePacker can receive an tap an gestures Event smartly.
![Png](https://github.com/ikemai/assets/blob/master/GesturePacker/GP_logo.png)

If it is UIView, You are usable even if You do not do anything special.
You perform registration and the movement of the event with a set.
You register the movement at the time of the event reception in closure.

![Gif](https://github.com/ikemai/assets/blob/master/GesturePacker/DemoMovie.gif)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

GesturePacker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

* swift
```ruby
pod "GesturePacker"
```
* swift 2.0
```ruby
pod 'GesturePacker', :git => "https://github.com/ikemai/GesturePacker.git", :branch => "swift-2.0"
```

### Example

* Create UIView

```swift
let view = UIView(frame: frame)
addSubview(view)
```

* Set gesture and handler

```swift
// Tap
view.gesture.tapHandler = {[weak self] tapGesture in
    if let me = self {
        me.labelView.text = "Tap Gesture"
    }
}

// Double tap
view.gesture.doubleTapHandler = {[weak self] tapGesture in
    if let me = self {
        me.labelView.text = "Double Tap Gesture"
    }
}

// Triple tap
view.gesture.tripleTapHandler = {[weak self] tapGesture in
    if let me = self {
        me.labelView.text = "Triple Tap Gesture"
    }
}

// Drag
dragView.gesture.dragHandler = {[weak self] gesture in
    if let me = self {
        me.labelView.text = "Dragging"
        me.dragView.frame.origin = gesture.translationInView(me.dragView)
    }
}

// Pinching
view.gesture.pinchHandler = {[weak self] pinchGesture in
    if let me = self {
        me.labelView.text = "Pinching Gesture"
    }
}

// Pinch in
view.gesture.pinchInHandler = {[weak self] pinchGesture in
    if let me = self {
        me.labelView.text = "Pinch In Gesture"
    }
}

// Pinch out
view.gesture.pinchOutHandler = {[weak self] sendar in
    if let me = self {
        me.labelView.text = "Pinch Out Gesture"
    }
}

// Swip to up
view.gesture.swipToUpHandler = {[weak self] sendar in
    if let me = self {
        me.labelView.text = "Swip To Up Gesture"
    }
}

// Swip to down
view.gesture.swipToDownHandler = {[weak self] sendar in
    if let me = self {
        me.labelView.text = "Swip To Down Gesture"
    }
}

// Swip to left
view.gesture.swipToLeftHandler = {[weak self] sendar in
    if let me = self {
        me.labelView.text = "Swip To Left Gesture"
    }
}

// Swip to right
view.gesture.swipToRightHandler = {[weak self] sendar in
    if let me = self {
        me.labelView.text = "Swip To Right Gesture"
    }
}
```

* Remove the set was all gestures

```swift
view.gesture.removeGestures()
view.gesture.removeHandlers()
```

### Function

* Remove the set was all gestures

```swift
public func removeGestures()
```
```swift
public func removeHandlers()
```

### Properties

```swift
// Tap
public var tapHandler: ((UITapGestureRecognizer) -> Void)?
public var doubleTapHandler: ((UITapGestureRecognizer) -> Void)? 
public var tripleTapHandler: ((UITapGestureRecognizer) -> Void)? 
// Drag
public var dragHandler: ((UIPanGestureRecognizer) -> Void)?
// Pinch
public var pinchHandler: ((UIPinchGestureRecognizer) -> Void)? 
public var pinchInHandler: ((UIPinchGestureRecognizer) -> Void)? 
public var pinchOutHandler: ((UIPinchGestureRecognizer) -> Void)? 
// Swip
public var swipToLeftHandler: ((UIGestureRecognizer) -> Void)?
public var swipToRightHandler: ((UIGestureRecognizer) -> Void)?
public var swipToUpHandler: ((UIGestureRecognizer) -> Void)? 
public var swipToDownHandler: ((UIGestureRecognizer) -> Void)? 
```

## Author

ikemai

## License

GesturePacker is available under the MIT license. See the LICENSE file for more info.
