//
//  CheckOutView.swift
//  OnlineGroceries
//
//  Created by Cypher on 15/05/2024.
//

import SwiftUI

struct CheckOutView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            HStack {
                
                Text("Checkout")
                    .font(.customfont(.bold, fontSize: 20))
                    .frame(height: 46)
                Spacer()
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image("close")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
                
            }
            .padding(.top, 30)
            
            Divider()
            
            VStack {
                HStack {
                    Text("Delivery Type")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.secondaryText)
                        .frame(height: 46)
                    
                    Spacer()
                }
                
                Divider()
                
                HStack {
                    Text("Delivery")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.secondaryText)
                        .frame(height: 46)
                    
                    Spacer()
                    
                    Text("Delivery")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.primaryText)
                        .frame(height: 46)
                    
                    Image("next")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.primaryText)
                }
                
                Divider()
                
                HStack {
                    Text("Payment Type")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.secondaryText)
                        .frame(height: 46)
                    
                    Spacer()
                }
                
                Divider()            }
            
            
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    CheckOutView()
}
