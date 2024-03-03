//
//  MoyaProvider+asyncRequest.swift
//  Assignment-3-MotionLab
//
//  Created by Rakha Fatih Athallah on 29/02/24.
//

import Foundation
import Moya

extension MoyaProvider {
    static func defaultProvider() -> MoyaProvider {
        return MoyaProvider(plugins: [NetworkLoggerPlugin()])
    }
}
