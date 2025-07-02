//
//  Search.swift
//  SintonizeDev
//
//  Created by Linda Marie Ribeiro Alves Correa dos Santos on 01/07/25.
//

import Foundation
import SwiftUI

struct Search: View {
    
    @Binding var searchText: String
    
    var body: some View{
        
        HStack() {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color("NewOrange"))
            
            TextField(
                "Adicione uma música na lista",
                text: $searchText
            )
            
        }
        .frame(width: UIScreen.main.bounds.width * Global.widthFramePercentage)
        .padding(.vertical, Global.spacingMedium)
        .padding(.horizontal, Global.paddingHorizontal)
        .background(Color.gray.opacity(Global.backgroundOpacity))
        .cornerRadius(Global.cornerRadiusSmall)
        .frame(maxWidth: .infinity, alignment: .center)
    }
        
   
}
