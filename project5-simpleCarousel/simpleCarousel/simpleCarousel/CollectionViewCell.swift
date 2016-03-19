//
//  CollectionViewCell.swift
//  simpleCarousel
//
//  Created by Hanson on 16/3/19.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ContentImage: UIImageView!
    
    @IBOutlet weak var ContentLabel: UILabel!
    
    var content : Content!{
        didSet{
            updateUI()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }
    
    private func updateUI(){
        ContentImage?.image! = content.featuredImage
        ContentLabel?.text! = content.title
    }
    

}
