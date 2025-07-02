import Foundation
import SwiftUI

class RoomViewModel: ObservableObject {
    @Published var room: Room
    @Published var searchText: String = ""
    @Published var showEndRoomAlert: Bool = false
    
    init(room: Room) {
        self.room = room
        if room.musics.isEmpty {
            self.room.musics = [
                Music(name: "Pra Ver Se Cola", artist: "Larissa Manoela", imageURL: nil, votes: Global.exampleVotesHigh),
                Music(name: "Pra Ver Se Cola", artist: "Larissa Manoela", imageURL: nil, votes: Global.exampleVotesHigh),
                Music(name: "Pra Ver Se Cola", artist: "Larissa Manoela", imageURL: nil, votes: Global.exampleVotesHigh)
               
            ]
        }
    }
    
    func vote(music: Music) {
        if let index = room.musics.firstIndex(of: music) {
            room.musics[index].votes += 1
        }
    }
} 
