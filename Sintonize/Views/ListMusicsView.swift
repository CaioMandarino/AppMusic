//
//  ListMusicsView.swift
//  Sintonize
//
//  Created by Raquel Souza on 04/07/25.
//

import SwiftUI

struct ListMusicsView: View {
    @FetchRequest(sortDescriptors: [])
    var musics: FetchedResults<MusicItem>
    
    @Environment(\.managedObjectContext) var moc
    
    init(for party: Party){
        _musics = FetchRequest(sortDescriptors: [NSSortDescriptor(key: "likes", ascending: false)],
                               predicate: NSPredicate(format: "party == %@", party),
                               animation: .default)
    }
    
    var body: some View {
        List {
            ForEach(musics) { music in
                MusicListItem(music: music) {
                    
                    if music.musicVoted {
                        music.likes -= 1
                    } else {
                        music.likes += 1
                    }
                    
                    music.musicVoted.toggle()
                    
                    try? moc.save()
                }
            }
        }
    }
}
