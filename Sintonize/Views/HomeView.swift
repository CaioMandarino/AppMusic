import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var parties: FetchedResults<Party>
    @StateObject private var viewModel = HomeViewModel()
    @State private var showCreateRoom = false
    @State private var showJoinRoom = false
    @State private var selectedRoom: Room? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                VStack(alignment: .leading, spacing: Global.spacingMedium) {
                    VStack(alignment: .leading, spacing: Global.spacingMedium) {
                        Text("Sala nova ou já rolando? Bora montar a playlist da festa com a galera!")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top, Global.paddingTopTitle)
                            .padding(.horizontal)
                        HStack(spacing: Global.spacingXLarge) {
                            Button(action: { showCreateRoom = true }) {
                                HStack {
                                    Image(systemName: "plus.circle.fill")
                                    Text("Criar sala")
                                        .bold()
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.newOrange)
                                .foregroundColor(.white)
                                .cornerRadius(Global.cornerRadiusLarge)
                            }
                            Button(action: { showJoinRoom = true }) {
                                HStack {
                                    Image(systemName: "arrow.right.circle.fill")
                                    Text("Entrar")
                                        .bold()
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .foregroundColor(.newOrange)
                                .cornerRadius(Global.cornerRadiusLarge)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, Global.spacingXXLarge)
                    VStack(alignment: .leading, spacing: Global.spacingSmall) {
                        Text("Histórico")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .padding(.top, Global.spacingMedium)
                        ForEach(viewModel.rooms) { room in
                            Button(action: { selectedRoom = room }) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(room.name)
                                            .font(.headline)
                                            .foregroundColor(.white)
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
                    Spacer()
                }
            }
            .navigationTitle("")
            .sheet(isPresented: $showCreateRoom) {
                CreateRoomView()
            }
            .sheet(isPresented: $showJoinRoom) {
                JoinRoomView()
            }
            .background(
                NavigationLink(destination: RoomView(room: selectedRoom ?? viewModel.rooms.first!), isActive: Binding(get: { selectedRoom != nil }, set: { if !$0 { selectedRoom = nil } })) {
                    EmptyView()
                }
                .hidden()
            )
        }
    }
}

#Preview {
    HomeView()
} 
