//
//  ImageModel.swift
//  OnlineGroceries
//
//  Created by Cypher on 06/02/2024.
//

import SwiftUI

struct ImageModel: Identifiable, Equatable {
    
    var id: Int = 0
    var productId: Int = 0
    var image: String = ""
    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "img_id") as? Int ?? 0
        self.productId = dict.value(forKey: "prod_id") as? Int ?? 0
        self.image = dict.value(forKey: "image") as? String ?? ""
    }
    
    static func == (lhs: ImageModel, rhs: ImageModel) -> Bool {
        return lhs.id == rhs.id
    }
    
}

//"": 4,
//              "": 5,
//              "": "http://localhost:3001/img/product/202307310947354735xuruflIucc.png"
