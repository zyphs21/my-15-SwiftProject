//
//  content.swift
//  simpleCarousel
//
//  Created by Hanson on 16/3/19.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class Content
{
    // MARK: - Public API
    var title = ""
    var description = ""
    var numberOfMembers = 0
    var numberOfPosts = 0
    var featuredImage: UIImage!
    
    init(title: String, description: String, featuredImage: UIImage!)
    {
        self.title = title
        self.description = description
        self.featuredImage = featuredImage
        numberOfMembers = 1
        numberOfPosts = 1
    }
    
    // MARK: - Private
    // dummy data
    static func createContents() -> [Content]
    {
        return [
            Content(title: "Hello there, my name is Linda", description: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. ", featuredImage: UIImage(named: "lion")!),
            Content(title: "whale", description: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea.",
                featuredImage: UIImage(named: "whale")!),
            Content(title: "I am a girl", description: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea.",
                featuredImage: UIImage(named: "hello")!),
            Content(title: "I'm running,indeed.", description: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea.", featuredImage: UIImage(named: "run")!)
        ]
    }

}
