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
    
    fileprivate var contents = Content.createContents()
    let CellIdentifier = "contentCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent  //设置状态栏字符为白色
    }
    
    //用struct定义
    fileprivate struct Storyboard {
        static let CellIdentifier = "contentCell"
    }

}

extension CollectionViewController : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier /*Storyboard.CellIdentifier*/, for: indexPath) as! CollectionViewCell
        
        collectionViewCell.content = contents[(indexPath as NSIndexPath).item]
        
        return collectionViewCell
    }
    
}

