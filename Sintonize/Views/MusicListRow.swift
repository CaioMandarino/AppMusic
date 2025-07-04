//
//  MusicListRow.swift
//  Sintonize
//
//  Created by Cauê Carneiro on 03/07/25.
//

import SwiftUI

struct MusicListRow: View {
    let music: Music
    @Binding var selectedMusics: [Music]
    
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
            Button(action: {
                if !selectedMusics.contains(where: { $0.id == music.id }) {
                    selectedMusics.append(music)
                    
                }
            }) {
                Image(systemName: selectedMusics.contains(where: { $0.id == music.id }) ? "checkmark.circle.fill" : "plus.circle.fill")
                    .foregroundColor(selectedMusics.contains(where: { $0.id == music.id }) ? .green : .newOrange)
                    .font(.title2)
            }
            .buttonStyle(.plain)
        }
    }
}

//#Preview {
//    MusicListRow()
//}
