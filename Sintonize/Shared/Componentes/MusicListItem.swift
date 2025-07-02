import SwiftUI

struct MusicListItem: View {
    let music: Music
    let onVote: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(music.name)
                    .font(.headline)
                Text(music.artist)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            HStack(spacing: 6) {
                Text("\(music.votes)")
                    .font(.subheadline)
                Button(action: onVote) {
                    Image(systemName: "heart.fill")
                    .foregroundColor(.newOrange)
                        
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
    }
}

#Preview {
    MusicListItem(music: Music(id: UUID(), name: "Pra Ver Se Cola", artist: "Larissa Manoela", votes: 10), onVote: {})
} 
