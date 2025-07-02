import SwiftUI

struct MusicListItem: View {
    let music: MusicItem
    let onVote: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: Global.spacingSmall) {
                Text(music.musicName ?? "")
                    .font(.headline)
                Text(music.musicArtist ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            HStack(spacing: Global.hStackSpacing) {
                Text("\(music.likes)")
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
