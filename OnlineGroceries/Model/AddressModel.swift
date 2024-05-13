//
//  AddressModel.swift
//  OnlineGroceries
//
//  Created by Cypher on 10/05/2024.
//

import SwiftUI

struct AddressModel: Identifiable, Equatable {
    
    var id: Int = 0
    var name: String = ""
    var phone: String = ""
    var address: String = ""
    var city: String = ""
    var state: String = ""
    var type_name: String = ""
    var postal_code: String = ""
    var is_default: Int = 0
    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "address_id") as? Int ?? 0
        self.name = dict.value(forKey: "name") as? String ?? ""
        self.phone = dict.value(forKey: "phone") as? String ?? ""
        self.address = dict.value(forKey: "address") as? String ?? ""
        self.city = dict.value(forKey: "city") as? String ?? ""
        self.state = dict.value(forKey: "state") as? String ?? ""
        self.type_name = dict.value(forKey: "type_name") as? String ?? ""
        self.postal_code = dict.value(forKey: "postal_code") as? String ?? ""
        self.is_default = dict.value(forKey: "is_default") as? Int ?? 0
    }
    
    static func == (lhs: AddressModel, rhs: AddressModel) -> Bool {
        return lhs.id == rhs.id
    }
    
}
