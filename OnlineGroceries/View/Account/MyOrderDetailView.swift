//
//  MyOrderDetailView.swift
//  OnlineGroceries
//
//  Created by Cypher on 22/05/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyOrderDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var detailVM: MyOrderDetailViewModel = MyOrderDetailViewModel(prodObj: MyOrderModel(dict: [:]))
    
    var body: some View {
        ZStack {
            
            ScrollView {
                
            }
            
            VStack {
                
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Text("My Order Detail")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.primaryText)
                    
                    Spacer()
                    
                }
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
        }
        .alert(isPresented: $detailVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(detailVM.errorMessage), dismissButton: .default(Text("Ok")))
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    MyOrderDetailView(detailVM: MyOrderDetailViewModel(prodObj: MyOrderModel(dict: [
        "offer_price": 2.49,
        "start_date": "2024-01-30T13:00:00.000Z",
        "end_date": "2024-07-30T13:00:00.000Z",
        "prod_id": 10,
        "cat_id": 1,
        "brand_id": 1,
        "type_id": 1,
        "name": "Bell Peppers",
        "detail": "Bell peppers (Capsicum annuum) are fruits that belong to the nightshade family. They are low in calories and rich in vitamin C and other antioxidants, making them an excellent addition to a healthy diet.",
        "unit_name": "gm",
        "unit_value": "250",
        "nutrition_weight": "100g",
        "price": 1.99,
        "image": "http://localhost:3001/img/product/20230731101409149FomkojOsMt.png",
        "cat_name": "Frash Fruits & Vegetable",
        "type_name": "Pulses",
        "is_fav": 0
    ])))
}
