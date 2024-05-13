//
//  ExploreView.swift
//  OnlineGroceries
//
//  Created by Cypher on 05/02/2024.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var exploreVM = ExploreViewModel.shared
    @State var txtSearch: String = ""
    
    var columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        
        ZStack {
            
            VStack {
                HStack {
                    Spacer()
                    Text("Find Products")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                }
                .padding(.top, .topInsets)
                
                SearchTextField(placeholder: "Search Store", txt: $txtSearch)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 4)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(exploreVM.listArr, id: \.id) { cObj in
                            NavigationLink {
                                ExploreItemView(itemsVM: ExploreItemViewModel(cObj: cObj))
                            } label: {
                                ExploreCategoryCell(cObj: cObj)
                                    .aspectRatio(0.95, contentMode: .fill)
                            }
                            
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .padding(.bottom, .bottomInsets + 60)
                }
                
            }
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    NavigationView {
        ExploreView()
    }
    
}
