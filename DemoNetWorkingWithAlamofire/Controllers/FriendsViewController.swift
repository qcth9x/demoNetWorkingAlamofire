//
//  FriendsViewController.swift
//  DemoNetWorkingWithAlamofire
//
//  Created by Lê Đình Linh on 26/06/2023.
//

import UIKit
import Kingfisher

class FriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    var friendsData: [FriensResponseModel] = []
    var filteredFriendsData: [FriensResponseModel] = []
    
    @IBOutlet weak var tblFriends: UITableView!
    
    @IBOutlet weak var btnAddFriend: UIButton!
    @IBAction func btnAddFriend(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tblFriends.dataSource = self
        tblFriends.delegate = self
        searchBar.delegate = self
        tblFriends.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: "FriendsCellIdentifier")
        cellAPIGetFriends()
        
        btnAddFriend.frame = CGRect(x: 300, y: 760, width: 60, height: 60)
        view.addSubview(btnAddFriend)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cellAPIGetFriends()
    }
    func cellAPIGetFriends() {
           APIHandler.init().getFriends { friendsResponseData in
               self.friendsData = friendsResponseData
               self.filteredFriendsData = friendsResponseData
               self.tblFriends.reloadData()
           }
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredFriendsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFriends.dequeueReusableCell(withIdentifier: "FriendsCellIdentifier") as! FriendsTableViewCell
        
        let avtFriendURL = URL(string: filteredFriendsData[indexPath.row].avatar)
        cell.imgAvtFriends.kf.setImage(with: avtFriendURL)
        
        cell.lblFullName.text = filteredFriendsData[indexPath.row].fullname
        cell.lblNickName.text = filteredFriendsData[indexPath.row].nickname
        cell.lblPhone.text = filteredFriendsData[indexPath.row].phone
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "AddFriendViewController") as! AddFriendViewController
        let person = FriensResponseModel(id: "\(friendsData[indexPath.row].id)", fullname: "\(friendsData[indexPath.row].fullname)", nickname: "\(friendsData[indexPath.row].nickname)", avatar: "\(friendsData[indexPath.row].avatar)", phone: "\(friendsData[indexPath.row].phone)")
        detailVC.person = person
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let friendID = filteredFriendsData[indexPath.row].id
            APIHandler.init().deleteFriend(friendID: friendID) { success in
                if success {
                    self.filteredFriendsData.remove(at: indexPath.row)
                    self.tblFriends.deleteRows(at: [indexPath], with: .fade)
                }
            }
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          if searchText.isEmpty {
              filteredFriendsData = friendsData // Nếu ô tìm kiếm trống, hiển thị toàn bộ danh sách bạn bè
          } else {
              filteredFriendsData = friendsData.filter { $0.fullname.lowercased().contains(searchText.lowercased()) } // Lọc danh sách bạn bè theo fullname
          }
          tblFriends.reloadData() // Cập nhật lại bảng danh sách bạn bè
      }
    
    
}
