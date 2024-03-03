//
//  DefaultResponse.swift
//  Assignment-3-MotionLab
//
//  Created by Rakha Fatih Athallah on 29/02/24.
//

import Foundation

struct ListDataResponse<T: Codable>: Codable {
    var data: [T]?
}

// non array response
struct DataResponse<T: Codable>: Codable {
    var data: T?
}
