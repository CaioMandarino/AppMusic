import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var showCreateRoom = false
    @State private var showJoinRoom = false
    @State private var selectedRoom: Room? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Sala nova ou já rolando? Bora montar a playlist da festa com a galera!")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top, 32)
                            .padding(.horizontal)
                        HStack(spacing: 16) {
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
                                .cornerRadius(12)
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
                                .cornerRadius(12)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 24)
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Histórico")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .padding(.top, 8)
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
                                .cornerRadius(10)
                            }
                            .buttonStyle(.plain)
                            .padding(.horizontal)
                            .padding(.vertical, 2)
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
