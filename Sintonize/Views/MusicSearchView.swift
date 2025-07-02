import SwiftUI

struct MusicSearchView: View {
    @Environment(\.dismiss) var dismiss
    @State private var searchText: String = ""
    @State private var suggestions: [Music] = [
        Music(id: UUID(), name: "Pra Ver Se Cola", artist: "Larissa Manoela", votes: 0),
        Music(id: UUID(), name: "Show das Poderosas", artist: "Anitta", votes: 0),
        Music(id: UUID(), name: "Evidências", artist: "Chitãozinho & Xororó", votes: 0)
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Search(searchText: $searchText)
                    .padding(.vertical)
                List {
                    ForEach(suggestions.filter { searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText) }) { music in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(music.name)
                                    .font(.headline)
                                Text(music.artist)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Button(action: {}) {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.newOrange)
                                    .font(.title2)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Adicionar Música")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") { dismiss() }
                    .foregroundColor(.newOrange)
                }
                
            }
        }
    }
}

#Preview {
    MusicSearchView()
} 
