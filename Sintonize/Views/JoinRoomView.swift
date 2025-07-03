import SwiftUI

struct JoinRoomView: View {
    @Environment(\.dismiss) var dismiss
    @State private var code: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: Global.spacingHuge) {
                Spacer().frame(height: Global.spacingHuge)
                Text("Entrar em uma sala existente?\nUse o código ou escaneie o QR Code para encontrar a sala!")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                TextField("Digite o código", text: $code)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(Global.cornerRadiusMedium)
                    .padding(.horizontal)
                Text("OU")
                    .font(.caption)
                    .foregroundColor(.gray)
                Button(action: {}) {
                    HStack {
                        Image(systemName: "qrcode.viewfinder")
                        Text("Escaneie o qr code")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.newOrange)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(Global.cornerRadiusMedium)
                }
                .padding(.horizontal)
                Button(action: { dismiss() }) {
                    Text("Entrar")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.newOrange)
                        .foregroundColor(.white)
                        .cornerRadius(Global.cornerRadiusLarge)
                }
                
                .padding(.horizontal)
                Spacer()
            }
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") { dismiss() }
                        .foregroundColor(.newOrange)
                }
            }
        }
        .tint(.newOrange)
    }
}

#Preview {
    JoinRoomView()
} 
