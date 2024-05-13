//
//  LineTextField.swift
//  OnlineGroceries
//
//  Created by Cypher on 30/01/2024.
//

import SwiftUI

struct LineTextField: View {
    @State var title: String = "Title"
    @State var placeholder: String = "Placeholder"
    @Binding var txt: String
    @State var keyboardtype: UIKeyboardType = .default
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
             TextField(placeholder, text: $txt)
                    .keyboardType(keyboardtype)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .frame(height: 40)
            
            
            Divider()
            
        }
    }
}

struct LineSecureField: View {
    @State var title: String = "Title"
    @State var placeholder: String = "Placeholder"
    @Binding var txt: String
    @Binding var isShowPassword: Bool
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if(isShowPassword) {
                TextField(placeholder, text: $txt)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .modifier(ShowButton(isShow: $isShowPassword))
                    .frame(height: 40)
            } else {
                SecureField(placeholder, text: $txt)
                    .autocapitalization(.none)
                    .modifier(ShowButton(isShow: $isShowPassword))
                    .frame(height: 40)
               
            }
            
            
            Divider()
            
        }
    }
}

//#Preview {
//    @State var txt: String = ""
//    
//    LineTextField(txt: $txt, title: "Title", placeholder: "Placeholder")
//}
