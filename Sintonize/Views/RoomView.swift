import SwiftUI

struct RoomView: View {
    @ObservedObject var party: Party
    @Environment(\.managedObjectContext) var moc
    @State var showSheet = false
    
    var body: some View {
        VStack {
            List {
                ForEach(party.musicArray) { music in
                    MusicListItem(music: music) {
                        
                        if music.musicVoted {
                            music.likes -= 1
                        } else {
                            music.likes += 1
                        }
                        
                        music.musicVoted.toggle()
                        
                        try? moc.save()
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
            MusicRoom(party: party)
        }
    }
}

//#Preview {
//    let config = NSConfigur
//    let container = NSPersistentContainer()
//    RoomView(party: )
//}
