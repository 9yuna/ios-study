//
//  BountyInfo.swift
//  BountyList
//
//  Created by Gyuna on 2020/08/05.
//  Copyright © 2020 gyuan. All rights reserved.
//

import UIKit

struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
