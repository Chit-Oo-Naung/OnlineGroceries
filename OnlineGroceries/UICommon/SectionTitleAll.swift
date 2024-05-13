//
//  SectionTitleAll.swift
//  OnlineGroceries
//
//  Created by Cypher on 05/02/2024.
//

import SwiftUI

struct SectionTitleAll: View {
    @State var title: String = "Title"
    @State var titleAll: String = "View All"
    var didTap: (()->())?
    
    var body: some View {
        HStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 24))
                .foregroundColor(.primaryText)
            
            Spacer()
            
            Text(titleAll)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.primaryApp)
        }
        .frame(height: 40)
    }
}

#Preview {
    SectionTitleAll()
}
