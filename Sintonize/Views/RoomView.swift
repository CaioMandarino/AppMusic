import SwiftUI

struct RoomView: View {
    @StateObject var viewModel: RoomViewModel
    
    init(room: Room) {
        _viewModel = StateObject(wrappedValue: RoomViewModel(room: room))
    }
    
    var body: some View {
        VStack(spacing: Global.spacingSmall) {
            HStack {
                VStack(alignment: .leading, spacing: Global.spacingSmall) {
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
                        .foregroundColor(.newOrange)
                }
            }
            .padding()
            Search(searchText: $viewModel.searchText)
                .padding(.bottom, Global.spacingMedium)
            if viewModel.room.musics.isEmpty {
                VStack(spacing: Global.spacingXLarge) {
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: Global.fontSizeIconLarge))
                    Text("Adicione músicas à lista da festa buscando no barra de pesquisa acima")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    Spacer()
                }
            } else {
                ScrollView {
                    VStack(spacing: Global.spacingLarge) {
                        ForEach(viewModel.room.musics) { music in
                            MusicListItem(music: music) {
                                viewModel.vote(music: music)
                            }
                        }
                    }
                    .padding(.top, Global.spacingMedium)
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
