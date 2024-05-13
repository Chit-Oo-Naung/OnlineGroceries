//
//  OnlineGroceriesApp.swift
//  OnlineGroceries
//
//  Created by Cypher on 29/01/2024.
//

import SwiftUI

@main
struct OnlineGroceriesApp: App {
    
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                
                if mainVM.isUserLogin {
                    MainTabView()
                } else {
                    WelcomeView()
                }
                
            }
            
        }
    }
}
