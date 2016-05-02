//
//  AJZoomViewContoller.swift
//  Pods
//
//  Created by Thirupathy Ragavan on 29/04/16.
//
//

import Foundation
import UIKit

@objc public protocol NSZoomTransitionAnimating:class {
    func transitionSourceImageView() -> UIImageView
    func transitionSourceBackgroundColor() -> UIColor
    func transitionDestinationImageViewFrame() -> CGRect
}

let kForwardAnimationDuration: NSTimeInterval = 0.3
let kForwardCompleteAnimationDuration: NSTimeInterval = 0.3
let kBackwardAnimationDuration: NSTimeInterval = 0.3
let kBackwardCompleteAnimationDuration: NSTimeInterval = 0.3

class AJZoomViewContoller: NSObject, UIViewControllerAnimatedTransitioning {
    var goingForward: Bool = false
    var sourceVC = UIViewController()
    var destinationVC = UIViewController()
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        if goingForward {
            return kForwardAnimationDuration + kForwardCompleteAnimationDuration;
        } else {
            return kBackwardAnimationDuration + kBackwardCompleteAnimationDuration;
        }
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView:AnyObject? = transitionContext.containerView()
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        
        let sourceImageView = UIImageView()
        var destinationImageView = UIImageView()
        
        var destinationImageViewFrame = CGRect()
        
        toVC.view.frame = transitionContext.finalFrameForViewController(toVC)
        
        containerView?.addSubview(fromVC.view)
        containerView?.addSubview(toVC.view)
        
        toVC.view.setNeedsLayout()
        toVC.view.layoutIfNeeded()
        
        if let sourceViewController = sourceVC as? NSZoomTransitionAnimating {
            //            sourceImageView = sourceViewController.transitionSourceImageView()
            sourceImageView.image = sourceViewController.transitionSourceImageView().image
            sourceImageView.frame = sourceViewController.transitionSourceImageView().frame
            containerView?.addSubview(sourceImageView)
        }
        
        if let destinationViewController = destinationVC as? NSZoomTransitionAnimating {
            destinationImageView = destinationViewController.transitionSourceImageView()
            destinationImageView.hidden = true
            destinationImageViewFrame = destinationViewController.transitionDestinationImageViewFrame()
        }else
        {
            
        }
        
        if self.goingForward {
            UIView.animateWithDuration(kForwardAnimationDuration, delay: 0, options: .CurveEaseOut, animations: {
                sourceImageView.frame = destinationImageViewFrame
                
                }, completion: {(finished: Bool) in
                    if finished {
                        destinationImageView.hidden = false
                        sourceImageView.removeFromSuperview()
                    }
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            })
        } else {
            UIView.animateWithDuration(kBackwardAnimationDuration, delay: 0, options: .CurveEaseOut, animations: {
                sourceImageView.frame = destinationImageViewFrame
                print(sourceImageView.frame)
                
                }, completion: {(finished: Bool) in
                    if finished {
                        destinationImageView.removeFromSuperview()
                        
                        print(sourceImageView.frame)
                        sourceImageView.removeFromSuperview()
                    }
                    
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            })
        }
    }
}