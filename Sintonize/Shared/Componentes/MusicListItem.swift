import SwiftUI

struct MusicListItem: View {
    let music: Music
    let onVote: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: Global.spacingSmall) {
                Text(music.name)
                    .font(.headline)
                Text(music.artist)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            HStack(spacing: Global.hStackSpacing) {
                Text("\(music.votes)")
                    .font(.subheadline)
                Button(action: onVote) {
                    Image(systemName: "heart.fill")
                    .foregroundColor(.newOrange)
                        
                }
                .buttonStyle(.plain)
            }
        }
        .frame(width: 330)
        .padding(.vertical, Global.spacingMedium)
        .padding(.horizontal)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(Global.cornerRadiusLarge)
    }
}

#Preview {
    MusicListItem(music: Music(id: UUID(), name: "Pra Ver Se Cola", artist: "Larissa Manoela", votes: 10), onVote: {})
} 
