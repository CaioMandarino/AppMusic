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
    
    var body: some View {
        
        NavigationStack {
            VStack{
                Search(searchText: $searchText)
                
                if musicList.isEmpty {
                    NoMusicList()
                } else {
                    List {
                        ForEach(musicList) { music in
                            HStack {
                                AsyncImage(url: music.imageURL) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                    
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 50, height: 50)
                                }
                                
                                VStack{
                                    Text(music.name)
                                        .font(.headline)
                                    Text(music.artist)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                        .onDelete(perform: deleteMusic)
                        
                    }
                }
                
                Spacer()
            }
            
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
