//
//  APIHandler.swift
//  DemoNetWorkingWithAlamofire
//
//  Created by Lê Đình Linh on 26/06/2023.
//

import Foundation
import Alamofire

//Chịu trách nhiệm làm việc với các API (Networking)
class APIHandler {
    
    //Hàm này chịu trách nhiệm gọi API lấy ra danh sách các cuộc hội thoại
    func getConversations(completion: @escaping (Conversations) -> ()) {
        AF.request("https://647df49daf984710854aad33.mockapi.io/conversations", method: .get).responseDecodable(of: Conversations.self) {
            (response) in
            if let conversationsResponse = response.value {
                completion(conversationsResponse)
            }
        }
    }
    
    func getFriends(completion: @escaping (Friends) -> ()) {
        AF.request("https://647df6b3af984710854ab338.mockapi.io/ChatZalo/Friends", method: .get).responseDecodable(of: Friends.self) {
            (response) in
            if let friendsResponse = response.value {
                completion(friendsResponse)
            }
        }
    }
    func deleteFriend(friendID: String, completion: @escaping (Bool) -> ()) {
        let url = "https://647df6b3af984710854ab338.mockapi.io/ChatZalo/Friends/\(friendID)"
        AF.request(url, method: .delete).response { response in
            if response.error == nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func addFriend(_friend: FriensResponseModel, completion: @escaping (Bool) -> ()) {
        let url = "https://647df6b3af984710854ab338.mockapi.io/ChatZalo/Friends"
        let parameters: [String: Any] = [
            "fullname": _friend.fullname,
            "nickname": _friend.nickname,
            "phone": _friend.phone
        ]
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).response { response in
            if response.error == nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }

    func updateFriend(id: String,_friend: FriensResponseModel, completion: @escaping (Bool) -> ()) {
        let url = "https://647df6b3af984710854ab338.mockapi.io/ChatZalo/Friends/\(id)"
        let parameters: [String: Any] = [
            "fullname": _friend.fullname,
            "nickname": _friend.nickname,
            "phone": _friend.phone
        ]
        AF.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default).response { response in
            if response.error == nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    

    
}
