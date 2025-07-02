import Foundation

class HomeViewModel: ObservableObject {
    @Published var rooms: [Room] = [
        Room(id: UUID(), name: "Na Praia", date: Date().addingTimeInterval(-86400 * 2), code: Global.exampleRoomCode1, musics: []),
        Room(id: UUID(), name: "15 da Raquel", date: Date().addingTimeInterval(-86400 * 10), code: Global.exampleRoomCode2, musics: []),
        Room(id: UUID(), name: "19 do Ju", date: Date().addingTimeInterval(-86400 * 30), code: Global.exampleRoomCode3, musics: []),
        Room(id: UUID(), name: "CIA", date: Date().addingTimeInterval(-86400 * 60), code: Global.exampleRoomCode4, musics: [])
    ]
} 