//
//  FriendsModel.swift
//  DemoNetWorkingWithAlamofire
//
//  Created by Lê Đình Linh on 26/06/2023.
//

import Foundation

struct FriensResponseModel: Decodable {
    var id: String
    var fullname: String
    var nickname: String
    var avatar: String
    var phone: String
    
    init(id: String, fullname: String, nickname: String, avatar: String, phone: String){
        self.id = id
        self.fullname = fullname
        self.nickname = nickname
        self.avatar = avatar
        self.phone = phone
    }
    
}

typealias Friends = [FriensResponseModel]
