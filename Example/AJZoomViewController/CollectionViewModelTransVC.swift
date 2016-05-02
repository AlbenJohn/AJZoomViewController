//
//  CollectionViewModelTransVC.swift
//  AJZoomViewController
//
//  Created by Thirupathy Ragavan on 29/04/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewModelTransVC: CollectionViewController, NSZoomTransitionAnimating, UIViewControllerTransitioningDelegate
{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK:
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Detail" {
            let vc = segue.destinationViewController as! CollectionviewDetailVC
            vc.transitioningDelegate = self
        }
    }
    var selectedIndexPath = NSIndexPath()

    //MARK: NSZoomTransitionAnimating
    func transitionSourceImageView() -> UIImageView {
        
        if let selectedIndexPath = collectionView!.indexPathsForSelectedItems()?.first {
            self.selectedIndexPath = selectedIndexPath
        }
        
        let cell = collectionView?.cellForItemAtIndexPath(self.selectedIndexPath) as! CollectionViewCell
        let imageView = UIImageView(image: cell.cellimageView.image)
        
        imageView.contentMode = cell.cellimageView.contentMode
        imageView.clipsToBounds = true
        imageView.userInteractionEnabled = false
        imageView.frame = cell.cellimageView.convertRect(cell.cellimageView.frame, toView: collectionView?.superview)
        return imageView
    }
    
    func transitionSourceBackgroundColor() -> UIColor {
        return UIColor.blackColor()
    }
    
    func transitionDestinationImageViewFrame() -> CGRect {
        let cell = collectionView?.cellForItemAtIndexPath(selectedIndexPath) as! CollectionViewCell
        let cellFrameInSuperview = cell.cellimageView.convertRect(cell.cellimageView.frame, toView: collectionView?.superview)
        
        return cellFrameInSuperview
    }
    
    //MARK: UIViewControllerTransitioningDelegate
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if source.conformsToProtocol(NSZoomTransitionAnimating) && presented.conformsToProtocol(NSZoomTransitionAnimating) {
            let animator = AJZoomViewContoller()
            animator.sourceVC = source
            animator.destinationVC = presented
            animator.goingForward = true
            return animator
        }else
        {
            let animator = AJZoomViewContoller()
            animator.sourceVC = source
            animator.destinationVC = presented
            animator.goingForward = true
            return animator
        }
        
       // return nil
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if dismissed.conformsToProtocol(NSZoomTransitionAnimating) && self.conformsToProtocol(NSZoomTransitionAnimating) {
            let animator = AJZoomViewContoller()
            animator.sourceVC = dismissed
            animator.destinationVC = self
            animator.goingForward = false
            return animator
        }else
        {
            let animator = AJZoomViewContoller()
            animator.sourceVC = dismissed
            animator.destinationVC = self
            animator.goingForward = false
            return animator
        }
        //return nil
    }

    
}