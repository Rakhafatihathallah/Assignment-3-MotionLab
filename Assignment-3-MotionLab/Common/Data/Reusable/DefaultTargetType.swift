//
//  DefaultTargetType.swift
//  Assignment-3-MotionLab
//
//  Created by Rakha Fatih Athallah on 29/02/24.
//

import Foundation
import Moya

protocol DefaultTargetType: TargetType {
    var parameters: [String:Any] { get }
}

extension DefaultTargetType {
    var baseURL: URL {
        return URL(string: "https://reqres.in/api") ?? (NSURL() as URL)
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        JSONEncoding.default
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
