//
//  ViewController.swift
//  simpleCarousel
//
//  Created by Hanson on 16/3/16.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var collectView: UICollectionView!
    
    private var contents = Content.createContents()
    let CellIdentifier = "contentCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent  //设置状态栏字符为白色
    }
    
    //用struct定义
    private struct Storyboard {
        static let CellIdentifier = "contentCell"
    }

}

extension CollectionViewController : UICollectionViewDataSource{
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(CellIdentifier /*Storyboard.CellIdentifier*/, forIndexPath: indexPath) as! CollectionViewCell
        
        collectionViewCell.content = contents[indexPath.item]
        
        return collectionViewCell
    }
}

