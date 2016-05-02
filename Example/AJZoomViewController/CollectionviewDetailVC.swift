//
//  CollectionviewDetailVC.swift
//  AJZoomViewController
//
//  Created by Thirupathy Ragavan on 29/04/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
class CollectionviewDetailVC:UIViewController,NSZoomTransitionAnimating {
    @IBOutlet weak var BigImageview: UIImageView!
    @IBAction func Closebuttontapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func transitionSourceImageView() -> UIImageView {
        return BigImageview
    }
    
    func transitionSourceBackgroundColor() -> UIColor {
        return view.backgroundColor!
    }
    
    func transitionDestinationImageViewFrame() -> CGRect {
        return BigImageview.frame
    }

}