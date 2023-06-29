//
//  ConversationResponseModel.swift
//  DemoNetWorkingWithAlamofire
//
//  Created by Lê Đình Linh on 26/06/2023.
//

import Foundation

struct ConversationResponseModel: Decodable {
    var createdAt: String
    var name: String
    var avatar: String
    var id: String
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "createdAt"
        case name = "name"
        case avatar = "avatar"
        case id = "id"
    }
}

typealias Conversations = [ConversationResponseModel]
