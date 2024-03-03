//
//  DetailView.swift
//  Assignment-3-MotionLab
//
//  Created by Rakha Fatih Athallah on 29/02/24.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel = DetailViewModel()
    let id: Int
    var body: some View {
        let user = viewModel.userDetail
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                AsyncImage(url: URL(string: user?.avatar ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: UIScreen().bounds.width)
                        .frame(height: 200)
                        
                    
                } placeholder: {
                    ProgressView()
                }.padding(.bottom, 50)
                
                VStack(alignment: .leading) {
                    Text("ID: \(user?.id ?? 0)")
                    Text("Name: \(user?.fullName ?? "")")
                    Text("Email: \(user?.email ?? "")")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
               
                
                
            }
            .onAppear {
                Task {
                    await viewModel.getSingleUser(by: id)
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: 1)
    }
}
