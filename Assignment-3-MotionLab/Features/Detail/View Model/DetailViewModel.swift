//
//  DetailViewModel.swift
//  Assignment-3-MotionLab
//
//  Created by Rakha Fatih Athallah on 29/02/24.
//

import Foundation

class DetailViewModel: ObservableObject {
    @Published private(set) var error: String?
    @Published var hasError: Bool = false
    @Published var isLoading: Bool = false
    
    @Published var userDetail : User?
        
    let userRepository : UserRepository
    
    init(userRepository: UserRepository =  DefaultUserRepository()) {
        self.userRepository = userRepository
    }
    
    @MainActor
    func getSingleUser(by id: Int) async {
        
        isLoading = true
        defer { isLoading = false }
        
        userRepository.getSingleUser(by: id) { [weak self] returnedData in
            switch returnedData {
            case .success(let success):
                self?.userDetail = success.data
            case .failure(let failure):
                self?.error = failure.localizedDescription
                self?.hasError = true
                print("FAILURE => \(failure.localizedDescription)")
            }
        }
    }
}
