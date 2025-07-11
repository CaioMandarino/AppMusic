import SwiftUI

struct HomeView: View {
    @FetchRequest(sortDescriptors: []) var parties: FetchedResults<Party>
    @StateObject private var viewModel = HomeViewModel()
    @State private var showCreateRoom = false
    @State private var showJoinRoom = false
    @Environment(\.managedObjectContext) var moc
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: Global.spacingMedium) {
                    VStack(alignment: .center, spacing: Global.spacingMedium) {
                        
                        Text("Sala nova ou já rolando? ")
                            .multilineTextAlignment(.center)
                            .font(.title2)
                            .bold(true)
                            .foregroundColor(.primary)
                            .padding(.top, Global.paddingTopTitle)
                        
                        Text("Monte a playlist da festa com a galera!")
                            .multilineTextAlignment(.center)
                            .font(.headline)
                            .bold(true)
                            .foregroundColor(.gray)
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
                                ZStack {
                                    HStack {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(party.partyName ?? "")
                                                .font(.headline)
                                                .foregroundColor(.primary)

                                            Text(party.partyDate?.formatted(date: .long, time: .omitted) ?? Date.now.formatted(date: .long, time: .omitted))
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                        }

                                        Spacer()
                                        
                                         Image(systemName: "chevron.right")
                                             .foregroundColor(.newOrange)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(12)
                                    .contentShape(Rectangle())

                                    NavigationLink(value: party) {
                                        EmptyView()
                                    }
                                    .opacity(0)
                                }
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                            }
                            .onDelete(perform: deleteParty)
                        }
                        .listStyle(.plain)
                    } header: {
                        Text("Histórico de Festas")
                            .font(.title)
                            .bold()
                            .padding()
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
    private func deleteParty(at offsets: IndexSet) {
        for index in offsets {
            let partyToDelete = parties[index]
            moc.delete(partyToDelete)
        }

        do {
            try moc.save()
        } catch {
            print("Erro ao deletar: \(error)")
        }
    }
}

#Preview {
    HomeView()
} 
