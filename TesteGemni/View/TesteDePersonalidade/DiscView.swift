import SwiftUI

struct DiscView: View {
    @EnvironmentObject var viewModel: DiscViewModel

    @AppStorage("testPerfilHasCompleted") private var testPerfilHasCompleted: Bool = false

    var body: some View {
        ZStack {
            // Fundo
            Image("backgroundImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)

            VStack {
                if viewModel.finished {
                    ResultView(viewModel: viewModel)
                } else {
                    QuestionView(viewModel: viewModel)
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 25)
            .animation(.easeInOut, value: viewModel.currentIndex)
            .animation(.default, value: viewModel.finished)
        }
        .onChange(of: viewModel.finished) { finished in
            if finished && !testPerfilHasCompleted {
                testPerfilHasCompleted = true
                print("✅ Teste finalizado e salvo no AppStorage!")
            }
        }
        .onAppear {
            print("📄 DiscView carregada | Teste concluído: \(testPerfilHasCompleted)")
        }
    }
}
