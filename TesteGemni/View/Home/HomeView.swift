//
//  HomeView.swift
//  TesteGemni
//
//  Created by Gustavo Souto Pereira on 11/11/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedJob: JobDetail? = nil
    @EnvironmentObject var appState: AppState
    let jobData = mockJobs

    var body: some View {
        NavigationStack {
            ZStack {
                // --- Background ---
                Image("backgrounImg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()


                // --- Conteúdo Principal ---
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Início")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(Color.text)
                            Text("12 de nov de 2025")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(Color.data)
                        }

                        Spacer()
                    }
                    .padding(.bottom, 10)
                    .padding(.horizontal)

                    Image("fraseHome")
                        .resizable()
                        .frame(width: 360, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding()

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Vagas que combinam com você")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.black)

                        Text(
                            "Com base no resultado do seu teste de perfil comportamental"
                        )
                        .font(.system(size: 13, weight: .thin))
                        .foregroundStyle(.black)
                    }
                    .padding()

                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(jobData) { job in
                            Button(action: {
                                self.selectedJob = job
                            }) {
                                VagaHeaderView(
                                    imageName: job.imageName,
                                    jobTitle: job.jobTitle,
                                    companyName: job.companyName
                                )
                                .foregroundColor(.black)
                            }
                        }

                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)

                }

            }
            .padding(.horizontal)
            .frame(maxHeight: .infinity)
            .sheet(item: $selectedJob) { job in
                JobDetailModalView(job: job) { description in
                    appState.jobDescriptionToPaste = description
                    appState.selectedTab = 1
                }
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
            }
        }

    }
}

#Preview {
    HomeView()
}
