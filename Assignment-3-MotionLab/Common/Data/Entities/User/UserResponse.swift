//
//  UserResponse.swift
//  Assignment-3-MotionLab
//
//  Created by Rakha Fatih Athallah on 29/02/24.
//

import Foundation

struct User: Codable, Identifiable {
    // Semua model yang berhubungan dengan Networking atau Local Storage, buat nullable untuk menghindari crash dari error
    var id: Int?
    var email: String?
    var firstName: String?
    var lastName: String?
    var avatar: String?
    
    var fullName: String {
        return (firstName ?? "") + " " + (lastName ?? "")
    }
    
    enum CodingKeys: String, CodingKey {
        case id,email,avatar
        case firstName = "first_name"
        case lastName = "last_name"
    }
}

