import Foundation

class HomeViewModel: ObservableObject {
    @Published var rooms: [Room] = [
        Room(id: UUID(), name: "Na Praia", date: Date().addingTimeInterval(-86400 * 2), code: "12345", musics: []),
        Room(id: UUID(), name: "15 da Raquel", date: Date().addingTimeInterval(-86400 * 10), code: "54321", musics: []),
        Room(id: UUID(), name: "19 do Ju", date: Date().addingTimeInterval(-86400 * 30), code: "67890", musics: []),
        Room(id: UUID(), name: "CIA", date: Date().addingTimeInterval(-86400 * 60), code: "24680", musics: [])
    ]
} 