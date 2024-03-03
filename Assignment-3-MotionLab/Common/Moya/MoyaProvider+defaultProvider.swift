//
//  MoyaProvider+defaultProvider.swift
//  Assignment-3-MotionLab
//
//  Created by Rakha Fatih Athallah on 29/02/24.
//

import Foundation
import Moya


//extension MoyaProvider {
//    
//    func asyncRequest<T: Codable>(_ target: Target,
//                                  model: T.Type) async throws -> T {
//
//        return try await withCheckedThrowingContinuation ({ continuation in
//            self.request(target) { result in
//                switch result {
//                case .failure(let moyaError):
//                    print("Moya Error => \(moyaError)")
//                    continuation.resume(throwing: moyaError)
//                case .success(let response):
//                    let decoder = JSONDecoder()
//                    decoder.dateDecodingStrategy = .iso8601
//
//                    do {
//                        let decodedData = try decoder.decode(model.self, from: response.data)
//                        continuation.resume(returning: decodedData)
//                    } catch {
//                        print("Error => \(error)")
//                        continuation.resume(throwing: error)
//                    }
//                }
//            }
//        })
//    }
//}


//    enum NetworkingError: LocalizedError {
//        case invalidURL
//        case invalidStatusCode(code: Int)
//        case custom(error: Error)
//        case invalidData
//        case failedToDecode(error: Error)
//    }
//
//
//extension NetworkingError {
//    var errorDescription: String? {
//        switch self {
//        case .invalidURL:
//            return "the URL is'nt valid!"
//        case .invalidStatusCode(let code):
//            return "status code \(code)"
//        case .custom(let error):
//            return "Something went wrong \(error.localizedDescription)"
//        case .invalidData:
//            return "Response data is not valid"
//        case .failedToDecode:
//            return "failed to decode"
//        }
//    }
//}
