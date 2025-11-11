import SwiftUI

struct CardProfileTest: View {
    @Binding var testRealized: Bool
    var onStartTest: () -> Void 

    var body: some View {
        HStack(alignment: .center) {
            VStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Perfil comportamental")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.text)
                    
                    Text("Realize o teste para saber seu perfil e combinar com a cultura das empresas")
                        .font(.system(size: 14))
                        .foregroundColor(.text)
                        .lineLimit(2)
                }

                Button(action: {
                    onStartTest() // ✅ aciona navegação controlada pela ProfileView
                }) {
                    Text("Fazer teste")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color.title)
                        .cornerRadius(8)
                }
            }
        }
        .padding(15)
        .background(Color.card)
        .cornerRadius(12)
        .padding(.bottom, 20)
    }
}
