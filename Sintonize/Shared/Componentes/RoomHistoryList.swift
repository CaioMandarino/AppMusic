import SwiftUI

struct RoomHistoryList: View {
    let rooms: [Room]
    let onSelect: (Room) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: Global.spacingSmall) {
            Text("Histórico")
                .font(.title2)
                .bold()
                .padding(.horizontal)
                .padding(.top, Global.spacingMedium)
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
                    .cornerRadius(Global.cornerRadiusMedium)
                }
                .buttonStyle(.plain)
                .padding(.horizontal)
                .padding(.vertical, Global.spacingSmall)
            }
        }
    }
}

#Preview {
    RoomHistoryList(rooms: [
        Room(id: UUID(), name: "Na Praia", date: Date(), code: Global.exampleRoomCode1, musics: []),
        Room(id: UUID(), name: "15 da Raquel", date: Date(), code: Global.exampleRoomCode2, musics: [])
    ], onSelect: { _ in })
} 
