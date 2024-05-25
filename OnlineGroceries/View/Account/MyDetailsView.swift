//
//  MyDetailsView.swift
//  OnlineGroceries
//
//  Created by Cypher on 25/05/2024.
//

import SwiftUI

struct MyDetailsView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var myVM = MyDetailViewModel.shared
    
    var body: some View {
        ZStack {
            
            ScrollView {
                VStack(spacing: 15) {
                    
                    LineTextField(title: "Name", placeholder: "Enter your name", txt: $myVM.txtName)
                    
//                    HStack {
//                        Button {
//                            isShowPicker = true
//                        } label: {
////                            Image("")
//                            
//                            if let countryObj = countryObj {
//                                Text("\(countryObj.isoCode.getFlag())")
//                                    .font(.customfont(.regular, fontSize: 35))
//                                
//                                Text("+\(countryObj.phoneCode)")
//                                    .font(.customfont(.regular, fontSize: 16))
//                                    .foregroundColor(.primaryText)
//                            }
//                            
//                        }
//                        
//                        TextField("Enter Mobile", text: $txtMobile)
//                            .frame(minWidth: 0, maxWidth: .infinity)
//                        
//                        
//                        
//                    }
                    
                    
                    LineTextField(title: "Mobile", placeholder: "Enter your mobile number", txt: $myVM.txtMobile, keyboardtype: .numberPad)
                    
                    LineTextField(title: "Username", placeholder: "Enter your username", txt: $myVM.txtUserName)
                    
                    RoundButton(title: "Update") {
                        myVM.serviceCallUpdate()
                    }
                    
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
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
                    
                    Text("My Details")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    
                    Spacer()
                    
                    
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 2)
                
                Spacer()
                
            }
        }
        .alert(isPresented: $myVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(myVM.errorMessage), dismissButton: .default(Text("Ok")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    MyDetailsView()
}
