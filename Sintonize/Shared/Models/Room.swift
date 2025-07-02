import Foundation

struct Room: Identifiable {
    let id: UUID
    var name: String
    var date: Date
    var code: String
    var musics: [Music]
} 