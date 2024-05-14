//
//  PaymentMethodsView.swift
//  OnlineGroceries
//
//  Created by Cypher on 14/05/2024.
//

import SwiftUI

struct PaymentMethodsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var payVM = PaymentViewModel.shared
    
    var body: some View {
        ZStack {
            
            ScrollView {
                LazyVStack(spacing: 15) {
                    ForEach(payVM.listArr, id: \.id, content: {
                        pObj in
                        
                        HStack(spacing: 15) {
                            Image("paymenth_methods")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                            
                            VStack(spacing: 4) {
                                
                                Text(pObj.name)
                                    .font(.customfont(.bold, fontSize: 18))
                                    .foregroundColor(.primaryText)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                Text("**** **** **** \(pObj.cardNumber)")
                                    .font(.customfont(.semibold, fontSize: 15))
                                    .foregroundColor(.primaryApp)
                                    .multilineTextAlignment(.leading)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                
                            }
                            
                            Button {
                                payVM.serviceCallRemove(cObj: pObj)
                            } label: {
                                Image("close")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                            }
                        }
                        .padding(15)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.black.opacity(0.15), radius: 2)
                        
                    })
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
                .padding(.bottom, .bottomInsets + 60)
            }
            
            
            VStack {
                
                HStack {
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                    
                    Spacer()
                    
                    Text("Payment Methods")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    
                    Spacer()
                    
                    NavigationLink() {
                        AddPaymentMethodView()
                    } label: {
                        Image("add_temp")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    .foregroundColor(.primaryText)
                    
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 2)
                
                Spacer()
                
            }
            
            
        }
        .alert(isPresented: $payVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(payVM.errorMessage), dismissButton: .default(Text("Ok")))
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
    }
}

#Preview {
    NavigationView {
        PaymentMethodsView()
    }
    
}
