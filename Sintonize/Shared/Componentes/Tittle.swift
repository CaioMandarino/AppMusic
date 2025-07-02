//
//  Tittle.swift
//  SintonizeDev
//
//  Created by Linda Marie Ribeiro Alves Correa dos Santos on 01/07/25.
//

import Foundation
import SwiftUI

struct Tittle: View {
    var text: String = ""
    var body: some View {
        HStack{
            Text(text)
                .padding(.top,32)
                .font(.system(size: 24, weight: .bold))
                .fontWeight(.semibold)
            Spacer()
        }
    }
}
