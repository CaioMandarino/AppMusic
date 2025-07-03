import SwiftUI

struct HomeView: View {
//    @Environment(\.managedObjectContext) var moc
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
                        Text("Bora montar a playlist com a galera!")
                            .font(.title2)
                            .bold(true)
                            .foregroundColor(.primary)
                            .padding(.top, Global.paddingTopTitle)
                            .padding(.horizontal)
                            .padding(.bottom, Global.paddingBottomLarge)
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
                    
                    Section {
                        List {
                            ForEach(parties) { party in
                                NavigationLink(value: party){
                                    Text(party.partyName ?? "")
                                }
                            }
                        }
                    } header: {
                        Text("Historico")
                            .padding()
                            .bold()
                    }
                }
            }
            .navigationTitle("")
            .sheet(isPresented: $showCreateRoom) {
                CreateRoomView()
            }
            .sheet(isPresented: $showJoinRoom) {
                JoinRoomView()
            }
            .navigationDestination(for: Party.self) { party in
                RoomView(party: party)
            }
            
        }
    }
}

#Preview {
    HomeView()
} 
