import SwiftUI

struct MusicListItem: View {
    @ObservedObject var music: MusicItem

    let onVote: () -> Void
    
    var body: some View {
        HStack {
            
            AsyncImage(url: URL(string: music.imageURL ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 56, height: 56)
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
                    .frame(width: 56, height: 56)
            }
            
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
                    Image(systemName: music.musicVoted ? "heart.fill" : "heart")
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


//#Preview {
//    MusicListItem(music: Music( name: "Pra Ver Se Cola", artist: "Larissa Manoela", imageURL: nil, votes: 10), onVote: {})
//}

