import SwiftUI

struct RoomView: View {
    @StateObject var viewModel: RoomViewModel
    
    init(room: Room) {
        _viewModel = StateObject(wrappedValue: RoomViewModel(room: room))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(viewModel.room.name)
                        .font(.largeTitle).bold()
                    Text("Código da sala: \(viewModel.room.code)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
                Button(action: { viewModel.showEndRoomAlert = true }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .foregroundColor(.accentColor)
                }
            }
            .padding()
            Search(searchText: $viewModel.searchText)
                .padding(.bottom, 8)
            if viewModel.room.musics.isEmpty {
                VStack(spacing: 16) {
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 48))
                        .foregroundColor(.accentColor)
                    Text("Adicione músicas à lista da festa buscando no barra de pesquisa acima")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    Spacer()
                }
            } else {
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(viewModel.room.musics) { music in
                            MusicListItem(music: music) {
                                viewModel.vote(music: music)
                            }
                        }
                    }
                    .padding(.top, 8)
                }
            }
        }
        .background(Color(.systemBackground))
        .ignoresSafeArea(edges: .bottom)
        .overlay(
            ConfirmEndRoomModal(isPresented: $viewModel.showEndRoomAlert, onConfirm: {}, onCancel: { viewModel.showEndRoomAlert = false })
        )
    }
}

#Preview {
    RoomView(room: Room(id: UUID(), name: "15 da Raquel", date: Date(), code: "54321", musics: []))
} 