//
//  MusicaSalaTest.swift
//  Sintonize
//
//  Created by Linda Marie Ribeiro Alves Correa dos Santos on 01/07/25.
//

import MusicKit
import SwiftUI


struct MusicRoom: View {
    @ObservedObject var party: Party
    @Environment(\.managedObjectContext) private var moc
    @State private var searchText: String = ""
    @State private var musicList: [Music] = []
    @State private var selectedMusics: [Music] = []
    
    var body: some View {
        
        NavigationStack {
            VStack{
                Search(searchText: $searchText)
                    .padding(.top, 8)
                
                if !selectedMusics.isEmpty {
                    Text("Músicas Salvas")
                        .font(.headline)
                        .padding(.top)

                    List {
                        ForEach(selectedMusics) { music in
                            MusicListRow(music: music, selectedMusics: $selectedMusics)
                                .padding(.vertical, 4)
                        }
                    }
                    .listStyle(.plain)
                }
                                Spacer()

                if searchText.isEmpty {
                    NoMusicList()
                    Spacer()
                } else {
                    
                    if musicList.isEmpty {
                        ProgressView()
                            .padding(.top)
                            .scaleEffect(1.4)
                    }
                    List {
                        ForEach(musicList) { music in
                            MusicListRow(music: music, selectedMusics: $selectedMusics, onSave: { music in
                                let newItem = MusicItem(context: moc)
                                newItem.id = UUID()
                                newItem.musicName = music.name
                                newItem.musicArtist = music.artist
                                newItem.imageURL = music.imageURL?.absoluteString
                                newItem.likes = 0

                                party.addToMusics(newItem)

                                do {
                                    try moc.save()
                                } catch {
                                    print("Erro ao salvar MusicItem: \(error)")
                                }
                            })
                            .padding(.vertical, 4)
                        }
                        .onDelete(perform: deleteMusic)
                    }
                    .listStyle(.plain)
                }
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
            .task {
                await fetchMusic() // so para carregar mais rapido
            }
            
            .navigationTitle(Text(party.partyName ?? ""))
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
                    return Music(name: song.title, artist: song.artistName, imageURL: song.artwork?.url(width: 150, height: 150))
                }
                
            } catch {
                print(error)
            }
                
        }
    }
}

//#Preview {
//    MusicRoom()
//}
