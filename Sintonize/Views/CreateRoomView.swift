import SwiftUI

struct CreateRoomView: View {
    @Environment(\.dismiss) var dismiss
    @State private var roomName: String = ""
    @State private var date: Date = Date()
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Nome da sala")) {
                        TextField("Digite o nome da sala", text: $roomName)
                    }
                    Section(header: Text("Data da festa")) {
                        DatePicker("", selection: $date, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .accentColor(.newOrange)
                    }
                }
            }
            .hideKeyboardOnTap()
            .navigationTitle("Criar Sala")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") { dismiss() }
                        .foregroundColor(.newOrange)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Criar") { dismiss() }
                        .foregroundColor(.newOrange)
                        .disabled(roomName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    CreateRoomView()
} 
