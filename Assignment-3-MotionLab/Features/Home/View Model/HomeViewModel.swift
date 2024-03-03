//
//  HomeViewModel.swift
//  Assignment-3-MotionLab
//
//  Created by Rakha Fatih Athallah on 29/02/24.
//

import Foundation


class HomeViewModel: ObservableObject {
    @Published private(set) var error: String?
    @Published var hasError: Bool = false
    
    @Published var userList : [User] = []
    
    @Published var state: ViewState?
    
    let userRepository : UserRepository
    
    var isLoading: Bool  {
        state == .isLoading
    }
    
    var isFinished: Bool {
        state == .finished
    }
    
    init(userRepository: UserRepository =  DefaultUserRepository(), state: ViewState = .isLoading) {
//        self.error = error
        self.userRepository = userRepository
        self.state = state
    }
    
    @MainActor
    func getAllUser() async {
        
        state = .isLoading
        defer { state = .finished }
        
        userRepository.getListUser { [weak self] returnedData in
            switch returnedData {
            case .success(let success):
                self?.userList = success.data ?? []
            case .failure(let failure):
                self?.error = failure.localizedDescription
                self?.hasError = true
                print("FAILURE => \(failure.localizedDescription)")
            }
        }
    }
}

extension HomeViewModel {
    enum ViewState {
        case isLoading
        case finished
    }
}
