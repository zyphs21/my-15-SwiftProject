//
//  TableViewCell.swift
//  localVideoPlayer
//
//  Created by Hanson on 16/3/1.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

struct video {
    let image: String
    let title: String
    let source: String
}

class TableViewCell: UITableViewCell {

    @IBOutlet weak var screanShot: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
