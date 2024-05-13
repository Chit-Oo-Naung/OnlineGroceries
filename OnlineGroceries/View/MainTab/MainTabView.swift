//
//  MainTabView.swift
//  OnlineGroceries
//
//  Created by Cypher on 05/02/2024.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var homeVM = HomeViewModel.shared
    
    var body: some View {
        ZStack {
            
            switch homeVM.selectTab {
            case 0:
                HomeView().tag(0)
            case 1:
                ExploreView().tag(1)
            case 2:
                MyCartView().tag(2)
            case 3:
                FavouriteView().tag(3)
            case 4:
                AccountView().tag(4)
            default:
                HomeView().tag(0)
            }
            
            VStack {
                Spacer()
                
                HStack {
                    
                    TabButton(title: "Shop", icon: "store_tab", isSelect: homeVM.selectTab == 0){
                        
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectTab = 0
                            }
                        }
                        
                    }
                    TabButton(title: "Explore", icon: "explore_tab", isSelect: homeVM.selectTab == 1){
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectTab = 1
                            }
                        }
                        
                    }
                    TabButton(title: "Cart", icon: "cart_tab", isSelect: homeVM.selectTab == 2){
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectTab = 2
                            }
                        }
                        
                    }
                    TabButton(title: "Favourite", icon: "fav_tab", isSelect: homeVM.selectTab == 3){
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectTab = 3
                            }
                        }
                        
                    }
                    TabButton(title: "Account", icon: "account_tab", isSelect: homeVM.selectTab == 4){
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selectTab = 4
                            }
                        }
                        
                    }
                    
                }
                .padding(.top, 10)
                .padding(.bottom, .bottomInsets)
                .padding(.horizontal, 10)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.15), radius: 3, x: 0, y: -2)
            }
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
}
