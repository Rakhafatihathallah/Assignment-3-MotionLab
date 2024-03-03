//
//  UserRepository.swift
//  Assignment-3-MotionLab
//
//  Created by Rakha Fatih Athallah on 29/02/24.
//

import Foundation
import Moya

typealias CompletionResult<T> = (Result<T,Error>) -> Void

//Repository: tempat untuk menyimpan semua yang berkaitan dengan pemanggilan data, baik local maupun remote
protocol UserRepository {
    func getListUser(completion: @escaping CompletionResult<ListDataResponse<User>>)
    func getSingleUser(by id: Int, completion: @escaping CompletionResult<DataResponse<User>>)
}



final class DefaultUserRepository: UserRepository {
    
    private let provider: MoyaProvider<UserTargetType>
    
    init(provider: MoyaProvider<UserTargetType> = .defaultProvider() ) {
        self.provider = provider
    }
    
    func getListUser(completion: @escaping CompletionResult<ListDataResponse<User>>) {
        provider.request(.getListUser) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try response.map(ListDataResponse<User>.self)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getSingleUser(by id: Int, completion: @escaping CompletionResult<DataResponse<User>>) {
        provider.request(.getSingleUser(id)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try response.map(DataResponse<User>.self)
                    completion(.success(decodedData))
                } catch {
                    // catch error decode
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
