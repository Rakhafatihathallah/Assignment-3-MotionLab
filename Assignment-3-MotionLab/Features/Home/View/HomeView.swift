//
//  HomeView.swift
//  Assignment-3-MotionLab
//
//  Created by Rakha Fatih Athallah on 29/02/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State var shouldShowCreate: Bool = false
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.isLoading {
                    ProgressView()
                    
                } else {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.userList, id: \.id) { user in
                            NavigationLink {
                                DetailView(id: user.id ?? 1)
                            } label: {
                                userRow(user)
                            }
                        }
                    }
                }
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                create
            }
        }
        .refreshable {
            Task {
                await viewModel.getAllUser()
            }
        }
        .onAppear {
            Task {
                await viewModel.getAllUser()
            }
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(title: Text("Error"), message: Text(viewModel.error ?? "Unknown error"), dismissButton: .default(Text("OK")))
        }
        
    }
}


private extension HomeView {
    @ViewBuilder
    func userRow(_ user: User) -> some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: user.avatar ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity)
                
                
                VStack() {
                    Text(user.fullName)
                        .font(.headline)
                        .foregroundColor(.primary)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
        }.padding()
    }
    
    var create: some View {
        Button {
            shouldShowCreate.toggle()
        } label: {
            Image(systemName: "plus")
                .font(.system(.headline, design: .rounded))
                .bold ()
        }
        //disable button when loading
        .disabled(viewModel.isLoading)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
