//
//  MusicaSalaTest.swift
//  Sintonize
//
//  Created by Linda Marie Ribeiro Alves Correa dos Santos on 01/07/25.
//

import SwiftUI

struct MusicRoom: View {
    @State private var searchText: String = ""
    
    var body: some View {
        
        NavigationStack {
            VStack{
                
//                Text("Código da sala: 12345")
//                    .foregroundColor(Color.gray)
//                    .padding(.top)
                
                Search(searchText: $searchText)
                .padding(.top, Global.spacingSearchTop)

                Tittle(text: "Lista de músicas")
                
                .padding(Global.horizontalSpace)
                
                NoMusicList()
                Spacer()
                
                    .toolbar{
                        ToolbarItem(placement: .principal) {
                            HStack{
                                Text("15 da Raquel")
                                    .font(.system(size: Global.fontSizeTitle, weight: .bold))
                                
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                
                            }){
                                Image("OutSymbol")
                            }
                        }
                    }
                    .toolbarTitleDisplayMode(.inline)
                
            }

        }
        
        
        
    }
}

#Preview {
    MusicRoom()
}
