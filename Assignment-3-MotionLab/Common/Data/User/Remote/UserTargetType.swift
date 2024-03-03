//
//  UserTargetType.swift
//  Assignment-3-MotionLab
//
//  Created by Rakha Fatih Athallah on 29/02/24.
//

import Foundation
import Moya

enum UserTargetType {
    case getListUser
    case getSingleUser(Int)
    case createUser(submissionData: Data?)
}

extension UserTargetType: DefaultTargetType {
    var parameters: [String : Any] {
        switch self {
        case .getListUser:
            return [:]
        case .getSingleUser:
            return [:]
        case .createUser:
            return [:]
        }
    }
    
    var path: String {
        switch self {
        case .getListUser:
            return "/users"
        case .getSingleUser(let id):
            return "/users/\(id)"
        case .createUser:
            return "/users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getListUser:
            return .get
        case .getSingleUser:
            return .get
        case .createUser:
            return .post
        }
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        switch self {
        case .getListUser:
            //gunakan URLEncoding kalau tidak ada body atau parameter saat request
            //gunakan JSONEncoding kalau terdapat body atau parameter saat request
            return URLEncoding.default
        case .getSingleUser:
            return URLEncoding.default
        case .createUser:
            return JSONEncoding.default
        }
    }
    
    var task: Task {
        switch self {
        case .getListUser:
            return .requestParameters(parameters: parameters, encoding: parameterEncoding)
        case .getSingleUser:
            return .requestParameters(parameters: parameters, encoding: parameterEncoding)
        case .createUser(let submissionData):
            return .requestJSONEncodable(submissionData)
        }
    }
    
}
