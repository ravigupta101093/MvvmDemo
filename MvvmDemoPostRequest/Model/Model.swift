//
//  Model.swift
//  MvvmDemoPostRequest
//
//  Created by Ravi kumar gupta on 13/03/21.
//

import Foundation

// MARK: - Result
struct Result: Codable {
    
    let deletedAt: String?
    let id: Int
    let firstName, lastName, contact, email: String
    let password, userType, status, createdAt: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case deletedAt = "deleted_at"
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case contact, email, password
        case userType = "user_type"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
}

typealias resultData = [Result]
