//
//  MusicaSalaTest.swift
//  Sintonize
//
//  Created by Linda Marie Ribeiro Alves Correa dos Santos on 01/07/25.
//

import MusicKit
import SwiftUI


struct MusicRoom: View {
    @State private var searchText: String = ""
    @State private var musicList: [Music] = []
    @State private var selectedMusics: [Music] = []
    
    var body: some View {
        
        NavigationStack {
            VStack{
                
                Search(searchText: $searchText)
                    .padding(.top, 8)
                
                if musicList.isEmpty {
                    NoMusicList()
                } else {
                    List {
                        ForEach(musicList) { music in
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
                            .padding(.vertical, 4)
                        }
                        .onDelete(perform: deleteMusic)
                    }
                    .listStyle(.plain)
                }
                
                Spacer()
            }
            .hideKeyboardOnTap()
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }){
                        Image("OutSymbol")
                    }
                }
            }

            .onChange(of: searchText) { _, _ in
                if searchText.isEmpty {
                    musicList.removeAll()
                    return
                }
                
                Task {
                    await fetchMusic()
                }
                
            }
            
            .navigationTitle(Text("15 da Raquel"))
        }
    }
    
    private func deleteMusic(at offsets: IndexSet) {
        for index in offsets {
            musicList.remove(at: index)
        }
    }
    
    private func fetchMusic() async {
        let status = await MusicAuthorization.request()
        if status == .authorized {
            var request = MusicCatalogSearchRequest(term: searchText, types: [Song.self])
            request.limit = 25

            
            do {
                let result = try await request.response()
                self.musicList = result.songs.compactMap { song in
                    return Music(name: song.title, artist: song.artistName, imageURL: song.artwork?.url(width: 50, height: 50))
                }
                
            } catch {
                print(error)
            }
                
        }
    }
}


#Preview {
    MusicRoom()
}
