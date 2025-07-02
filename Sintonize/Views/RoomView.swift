import SwiftUI

struct RoomView: View {
    let party: Party
    @Environment(\.managedObjectContext) var moc
    @State var showSheet = false
    
    var body: some View {
        VStack {
            List {
                ForEach(party.musicArray) { music in
                    MusicListItem(music: music) {
                        music.likes += 1
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing){
                Button("Add", systemImage: "plus"){
                    showSheet = true
                }
            }
        }
        .navigationTitle(Text(party.partyName ?? ""))
        .sheet(isPresented: $showSheet) {
            MusicRoom()
        }
    }
}
