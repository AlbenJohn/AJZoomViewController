//
//  NavigationController.swift
//  Pods
//
//  Created by Thirupathy Ragavan on 29/04/16.
//
//

import Foundation
import UIKit

class NavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if fromVC.conformsToProtocol(NSZoomTransitionAnimating) && toVC.conformsToProtocol(NSZoomTransitionAnimating) {
            let animator = AJZoomViewContoller()
            animator.sourceVC = fromVC
            animator.destinationVC = toVC
            animator.goingForward = (operation == UINavigationControllerOperation.Push)
            return animator
        }
        
        return nil
    }
}
