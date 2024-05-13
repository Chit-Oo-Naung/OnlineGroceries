//
//  ExploreItemView.swift
//  OnlineGroceries
//
//  Created by Cypher on 09/02/2024.
//

import SwiftUI

struct ExploreItemView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var itemsVM = ExploreItemViewModel(cObj: ExploreCategoryModel(dict: [:]))
    
    var columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        ZStack {
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
                    
                    Text(itemsVM.cObj.name)
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("filter_ic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                }
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(itemsVM.listArr, id: \.id) { pObj in
                            ProductCell(pObj: pObj, width: .infinity) {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                    self.itemsVM.errorMessage = msg
                                    self.itemsVM.showError = true
                                }
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.bottom, .bottomInsets + 60)
                }
                
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
        }
        .alert(isPresented: $itemsVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(itemsVM.errorMessage), dismissButton: .default(Text("OK")))
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
//    NavigationView {
//        
//    }
    ExploreItemView(itemsVM: ExploreItemViewModel(cObj: ExploreCategoryModel(dict: [
        "cat_id": 1,
        "cat_name": "Frash Fruits & Vegetable",
        "image": "http://localhost:3001/img/category/20230726155407547qM5gSxkrCh.png",
        "color": "53B175"
    ])))
}
