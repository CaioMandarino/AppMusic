import SwiftUI

struct CreateRoomView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    
    @State private var partyName: String = ""
    @State private var partyDate: Date = Date()
            
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Nome da sala")) {
                    TextField("Digite o nome da sala", text: $partyName)
                }
                Section(header: Text("Data da festa")) {
                    DatePicker("", selection: $partyDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .accentColor(.newOrange)
                }
            }
            .navigationTitle("Criar Sala")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") { dismiss() }
                        .foregroundColor(.newOrange)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Criar") {
                        let party = Party(context: moc)
                        party.partyName = partyName
                        party.partyDate = partyDate
                        party.id = UUID()
                        
                        dismiss()
                    }
                        .foregroundColor(.newOrange)
                        .disabled(partyName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    CreateRoomView()
} 
