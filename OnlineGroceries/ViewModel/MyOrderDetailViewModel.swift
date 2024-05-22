//
//  MyOrderDetailViewModel.swift
//  OnlineGroceries
//
//  Created by Cypher on 22/05/2024.
//

import SwiftUI


class MyOrderDetailViewModel: ObservableObject {
    
    @Published var pObj: MyOrderModel = MyOrderModel(dict: [:])
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [ProductModel] = []
    
    init(prodObj: MyOrderModel) {
        self.pObj = prodObj
        serviceCallDetail()
    }
    
    //MARK: ServiceCall
    
    func serviceCallDetail() {
        ServiceCall.post(parameter: ["order_id":self.pObj.id], path: Globs.SV_MY_ORDER_DETAIL, isToken: true) { responseObj in
            if let response = responseObj as? NSDictionary {
                
                if response.value(forKey: KKey.status) as? String ?? "" ==  "1" {
                  
                    if let payloadObj = response.value(forKey: KKey.payload) as? NSDictionary {
                        
                        self.pObj = MyOrderModel(dict: payloadObj)
                        
                        self.listArr = (payloadObj.value(forKey: "cart_list") as? NSArray ?? []).map({ obj in
                            return ProductModel(dict: obj as? NSDictionary ?? [:])
                        })
                    }
                   
                } else {
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    
}
