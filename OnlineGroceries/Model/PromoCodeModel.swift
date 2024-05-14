//
//  PromoCodeModel.swift
//  OnlineGroceries
//
//  Created by Cypher on 14/05/2024.
//

import SwiftUI

struct PromoCodeModel: Identifiable, Equatable {
    
    var id: Int = 0
    var type: Int = 0
    
    var title: String = ""
    var description: String = ""
    var code: String = ""
    var startDate: Date = Date()
    var endDate: Date = Date()
    var min_order_amount: Double = 0.0
    var max_discount_amount: Double = 0.0
    var offer_price: Double = 0.0
    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "promo_code_id") as? Int ?? 0
        self.title = dict.value(forKey: "title") as? String ?? ""
        self.description = dict.value(forKey: "description") as? String ?? ""
        self.code = dict.value(forKey: "code") as? String ?? ""
        self.startDate = (dict.value(forKey: "start_date") as? String ?? "").stringDateToDate() ?? Date()
        self.endDate = (dict.value(forKey: "end_date") as? String ?? "").stringDateToDate() ?? Date()
        self.type = dict.value(forKey: "type") as? Int ?? 0
        self.min_order_amount = dict.value(forKey: "min_order_amount") as? Double ?? 0
        self.max_discount_amount = dict.value(forKey: "max_discount_amount") as? Double ?? 0
        self.offer_price = dict.value(forKey: "offer_price") as? Double ?? 0
    }
    
    static func == (lhs: PromoCodeModel, rhs: PromoCodeModel) -> Bool {
        return lhs.id == rhs.id
    }
    
}
