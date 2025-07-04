import SwiftUI

struct CreateRoomView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss

    @State private var partyName: String = ""
    @State private var partyDate: Date = Date()

    

    var body: some View {
            
            var isFormValid: Bool {
                !partyName.isEmpty
            }
            
            NavigationStack {
                Form {
                    Section(header: Text("Nome da sala")) {
                        TextField("Digite o nome da sala", text: $partyName)
                    }
                    .tint(.newOrange)
                    
                    
                    Section(header: Text("Data da festa")){
                        HStack {
                            DatePicker(
                                "",
                                selection: $partyDate,
                                displayedComponents: .date
                            )
                            .datePickerStyle(.wheel)
                            .accentColor(.newOrange)
                        }
                    }
                    
                }
                .navigationTitle("Criar Sala")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancelar") {
                            dismiss()
                        }
                        .foregroundColor(.newOrange)
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Criar") {
                            let party = Party(context: moc)
                            party.partyName = partyName
                            party.partyDate = partyDate
                            party.id = UUID()
                            
                            try? moc.save()
                            dismiss()
                        }
                        .disabled(partyName.isEmpty)
                        .foregroundColor(isFormValid ? .newOrange : .gray)
                    }
                }
            }
        }
}


#Preview {
    CreateRoomView()
} 
