//
//  MyDetailViewModel.swift
//  OnlineGroceries
//
//  Created by Cypher on 25/05/2024.
//

import SwiftUI

class MyDetailViewModel: ObservableObject {
    static var shared: MyDetailViewModel = MyDetailViewModel()
    
    @Published var txtName: String = ""
    @Published var txtMobile: String = ""
    @Published var txtUserName: String = ""
    @Published var txtMobileCode: String = ""
    
    @Published var txtCurrentPassword: String = ""
    @Published var txtNewPassword: String = ""
    @Published var txtConfirmPassword: String = ""
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [AddressModel] = []
    @Published var total: String = "0.0"
    
    init() {
        setData()
    }
    
    func clearAll() {
        txtName = ""
        txtMobile = ""
        txtUserName = ""
        txtMobileCode = ""
        txtCurrentPassword = ""
        txtNewPassword = ""
        txtConfirmPassword = ""
    }
    
    func setData() {
        var userObj = MainViewModel.shared.userObj
        txtName = userObj.name
        txtMobile = userObj.mobile
        txtUserName = userObj.username
        txtMobileCode = userObj.mobileCode
    }
    
    //MARK: ServiceCall
    
    func serviceCallUpdate() {
        
        if(txtName.isEmpty) {
            self.errorMessage = "Please enter name"
            self.showError = true
            return
        }
        
        if(txtMobile.isEmpty) {
            self.errorMessage = "Please enter mobile"
            self.showError = true
            return
        }
        
        if(txtUserName.isEmpty) {
            self.errorMessage = "Please enter username"
            self.showError = true
            return
        }
        
        ServiceCall.post(parameter: ["name": txtName, "mobile": txtMobile, "username": txtUserName, "mobile_code": txtMobileCode], path: Globs.SV_UPDATE_PROFILE, isToken: true) { responseObj in
            if let response = responseObj as? NSDictionary {
                
                if response.value(forKey: KKey.status) as? String ?? "" ==  "1" {
                    
                    MainViewModel.shared.setUserData(uDict: response.value(forKey: KKey.payload) as? NSDictionary ?? [:])
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Success"
                    self.showError = true
                    
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
    
    func serviceCallChangePassword() {
        
        if(txtCurrentPassword.isEmpty) {
            self.errorMessage = "Please enter current password"
            self.showError = true
            return
        }
        
        if(txtNewPassword.count < 6) {
            self.errorMessage = "Please enter new password minimum 5 characters"
            self.showError = true
            return
        }
        
        if(txtNewPassword != txtConfirmPassword) {
            self.errorMessage = "Password not match"
            self.showError = true
            return
        }
        
        ServiceCall.post(parameter: ["current_password": txtCurrentPassword, "new_password": txtNewPassword], path: Globs.SV_CHANGE_PASSWORD, isToken: true) { responseObj in
            if let response = responseObj as? NSDictionary {
                
                if response.value(forKey: KKey.status) as? String ?? "" ==  "1" {
                    
                    self.txtCurrentPassword = ""
                    self.txtNewPassword = ""
                    self.txtConfirmPassword = ""
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Success"
                    self.showError = true
                    
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
