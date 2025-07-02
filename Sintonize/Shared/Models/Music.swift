import Foundation

struct Music: Identifiable, Equatable {
    let id: UUID
    var name: String
    var artist: String
    var votes: Int
} 