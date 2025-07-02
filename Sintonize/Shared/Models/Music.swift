import Foundation

struct Music: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let artist: String
    let imageURL: URL?
    var votes: Int = 0
} 
