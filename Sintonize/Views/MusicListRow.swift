//
//  MusicListRow.swift
//  Sintonize
//
//  Created by Cauê Carneiro on 03/07/25.
//

import SwiftUI

struct MusicListRow: View {
    
    let music: Music
    var onSave: ((Music) -> Void)
    @State var showCheckmark: Bool = false
    
    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: music.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 56, height: 56)
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
                    .frame(width: 56, height: 56)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(music.name)
                    .font(.headline)
                Text(music.artist)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            Button {
                showCheckmark = true
                onSave(music)
            }
            label: {
                Image(systemName: showCheckmark ? "checkmark.circle.fill" : "plus.circle.fill" ) // : ""
                    .foregroundColor(showCheckmark ? .green : .newOrange) // selectedMusics.contains(where: { $0.id == music.id }) ? .green :
                    .font(.title2)
            }
            
            .buttonStyle(.plain)
        }
    }
}

//#Preview {
//    MusicListRow()
//}
