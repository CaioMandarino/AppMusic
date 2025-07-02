import SwiftUI

struct ConfirmEndRoomModal: View {
    @Binding var isPresented: Bool
    var onConfirm: () -> Void
    var onCancel: () -> Void
    
    var body: some View {
        EmptyView()
            .alert(isPresented: $isPresented) {
                Alert(
                    title: Text("Tem certeza que deseja encerrar a sala?"),
                    message: Text("Caso encerre, nenhuma música poderá ser adicionada."),
                    primaryButton: .destructive(Text("Encerrar"), action: onConfirm),
                    secondaryButton: .cancel(onCancel)
                )
            }
    }
}

#Preview {
    ConfirmEndRoomModal(isPresented: .constant(true), onConfirm: {}, onCancel: {})
} 