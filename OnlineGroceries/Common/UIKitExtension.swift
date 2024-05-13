//
//  UIKitExtension.swift
//  OnlineGroceries
//
//  Created by Cypher on 31/01/2024.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-a]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func stringDateToDate(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date? {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.date(from: self)
    }
    
    func stringDateChangeFormat(format: String, newFormat: String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        if let dt = dateFormat.date(from: self) {
            dateFormat.dateFormat = newFormat
            return dateFormat.string(from: dt)
        } else {
            return ""
        }
    }
    
}

extension Date {
    func displayDate(format: String, addMinTime: Int = 0) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        let date = self.addingTimeInterval(TimeInterval(60 * addMinTime))
        return dateFormat.string(from: date)
    }
}
