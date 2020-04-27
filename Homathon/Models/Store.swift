//
//  Store.swift
//  Homathon
//
//  Created by يعرب المصطفى on 4/22/20.
//  Copyright © 2020 yarob. All rights reserved.
//

import Foundation
import UIKit

class Store{
    var name: String?
    var image: UIImage?
    var status: StoreStatus?
    var id: Int?
    var isAvailable: Bool? = true
    var distance: String?
    var times: String?
    var capacity: String?
    var reserved: Bool = false
    
    init(id: Int?, name: String?, image: UIImage?, status: StoreStatus?, distance: String?, times: String?, capacity: String?, isAvailable: Bool? = true){
        self.id = id
        self.name = name
        self.image = image
        self.status = status
        self.isAvailable = isAvailable
        self.distance = distance
        self.times = times
        self.capacity = capacity
    }
}


enum StoreStatus{
    case normal
    case reserved
}
