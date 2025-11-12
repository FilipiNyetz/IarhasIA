import SwiftUI

struct ProfileView: View {
    @AppStorage("testPerfilHasCompleted") private var testPerfilHasCompleted: Bool = false
    @State private var showDiscView: Bool = false // ✅ controla a
    
    @EnvironmentObject var viewModel: DiscViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                Image("backgrounImg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(alignment: .leading, spacing: 0) {
                    // Cabeçalho
                    HStack {
                        Text("Perfil")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(Color.text)
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 25)

                    ScrollView(showsIndicators: false){
                        VStack(alignment: .leading, spacing: 25) {
                            // Cartão de perfil
                            ProfileDetailsCard(
                                profilePic: profile.profilePic,
                                nmeProfile: profile.nameProfile,
                                jobDescribe: profile.jobDescribe
                            )
                            .padding(.horizontal, 20)
        //                    .padding(.bottom, 25)
                            
                            // Card de teste OU DiscView
                            if testPerfilHasCompleted {
                                ResultView(viewModel: viewModel)
                            } else {
                                CardProfileTest(
                                    testRealized: $testPerfilHasCompleted,
                                    onStartTest: { showDiscView = true }
                                )
                                .padding(.horizontal, 20)
                            }
                            
                            Divider()
                                .foregroundStyle(Color.text)
                            
                            Text("Minhas publicações")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.black)
                                .padding(.bottom, 15)
                                .padding(.top, 10)
                                .padding(.horizontal, 20)
                            
                            LazyVStack(spacing: 25) {
                                ForEach(postsProfile) { post in
                                    PostComponentView(
                                        imageProfile: post.profilePic,
                                        nameProfile: post.nameProfile,
                                        jobDescribe: post.jobDescribe,
                                        datePost: post.postedAt,
                                        subtitlePost: post.subTitle,
                                        imagePost: post.postImage,
                                        isLiked: post.isLiked,
                                        totalComments: post.numberOfComments
                                    )
                                }
                            }
                            .padding(.bottom, 100)
                            .padding(.horizontal, 20)
                            
                            
                        }

                        
                        Spacer()
                    }
                }
                // ✅ Navegação real controlada pelo estado local
                .navigationDestination(isPresented: $showDiscView) {
                    DiscView()
                }
            }
        }
    }
}
