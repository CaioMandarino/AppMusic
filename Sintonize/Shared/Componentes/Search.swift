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
                .foregroundColor(Color("newOrange"))
            
            TextField(
                "Adicione uma música na lista",
                text: $searchText
            )
            
        }
        .frame(width: UIScreen.main.bounds.width * 0.8)
        .padding(.vertical, 8)
        .padding(.horizontal, 22)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(8)
        .frame(maxWidth: .infinity, alignment: .center)
    }
        
   
}
