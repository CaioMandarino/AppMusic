import SwiftUI

struct RoomHistoryList: View {
    let rooms: [Room]
    let onSelect: (Room) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Histórico")
                .font(.title2)
                .bold()
                .padding(.horizontal)
                .padding(.top, 8)
            ForEach(rooms) { room in
                Button(action: { onSelect(room) }) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(room.name)
                                .font(.headline)
                            Text(room.date, style: .date)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.newOrange)
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                }
                .buttonStyle(.plain)
                .padding(.horizontal)
                .padding(.vertical, 2)
            }
        }
    }
}

#Preview {
    RoomHistoryList(rooms: [
        Room(id: UUID(), name: "Na Praia", date: Date(), code: "12345", musics: []),
        Room(id: UUID(), name: "15 da Raquel", date: Date(), code: "54321", musics: [])
    ], onSelect: { _ in })
} 
