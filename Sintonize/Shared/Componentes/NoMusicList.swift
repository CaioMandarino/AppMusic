//
//  NoMusicList.swift
//  SintonizeDev
//
//  Created by Linda Marie Ribeiro Alves Correa dos Santos on 01/07/25.
//

import Foundation
import SwiftUI

struct NoMusicList: View {
    var body: some View {
        Spacer()
        VStack{
            Image(systemName: "magnifyingglass.circle")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(Color("newOrange"))
            Text("Adicione músicas na lista da festa buscando na barra de pesquisa acima")
                .foregroundColor(Color.gray)
                .frame(width: UIScreen.main.bounds.width * Global.widthFramePercentage)
                .multilineTextAlignment(.center)
                .padding(.top)
        }
    }
}

