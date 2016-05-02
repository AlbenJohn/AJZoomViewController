//
//  ViewController.swift
//  AJZoomViewController
//
//  Created by Prabakaranm on 04/29/2016.
//  Copyright (c) 2016 Prabakaranm. All rights reserved.
//

import UIKit
import Foundation


let kCellMargin: CGFloat = 5

let resuse_identifier = "ImageCollectionViewcell" 
class CollectionViewController: UICollectionViewController {

    
    var ImagesArray1:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.collectionView?.registerNib(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: resuse_identifier)

        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
        
        ImagesArray1 = ["01_S.jpeg","02_S.jpeg","03_S.jpeg","04_S.jpeg","05_S.jpeg","06_S.jpeg","07_S.jpeg","08_S.jpeg","09_S.jpeg","10_S.jpeg"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //CollectionViewdataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return ImagesArray1.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(resuse_identifier, forIndexPath: indexPath) as! CollectionViewCell
        
        let mmm = ImagesArray1[indexPath.row]
        cell.cellimageView.image = UIImage(named:mmm as! String)
//        cell.cellLabelname.text = "\(indexPath.section):\(indexPath.row)"
        return cell
    }
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if let cell = collectionView.cellForItemAtIndexPath(indexPath) {
            performSegueWithIdentifier("Detail", sender: cell)
        }
    }

    
}
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    // MARK:- UICollectioViewDelegateFlowLayout methods
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        //let kCellMargin: CGFloat = 5
        
        let length: CGFloat = (CGRectGetWidth(self.view.frame) / 2) - (kCellMargin * 2)
        
        //let length = (UIScreen.mainScreen().bounds.width-15)/2
        return CGSizeMake(length,length);
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: kCellMargin, bottom: kCellMargin, right: kCellMargin)
    }
    
    
}

