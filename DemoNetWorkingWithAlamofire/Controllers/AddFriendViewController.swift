//
//  AddFriendViewController.swift
//  DemoNetWorkingWithAlamofire
//
//  Created by Lê Đình Linh on 28/06/2023.
//

import UIKit

class AddFriendViewController: UIViewController {
    
    var person = FriensResponseModel(id: "", fullname: "", nickname: "", avatar: "", phone: "")
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtNickName: UITextField!
    @IBOutlet weak var txtFullName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.person.fullname)
        self.txtFullName.text = person.fullname
        self.txtNickName.text = person.nickname
        self.txtPhone.text = person.phone
        
        if person.id.isEmpty {
            self.lblTitle.text = "ADD FRIEND"
        } else {
            self.lblTitle.text = "UPDATE INFOMATION"
        }
    }
    
    @IBAction func btnAddFriend(_ sender: UIButton) {
        if txtFullName.text != "" && txtNickName.text != "" && txtPhone.text != ""{
            let friend = FriensResponseModel(id: "", fullname: "\(txtFullName.text ?? "")", nickname: "\(txtNickName.text ?? "")", avatar: "img.jpg", phone: "\(txtPhone.text ?? "")")
            
            if person.id .isEmpty {
                APIHandler.init().addFriend(_friend: friend) { success in
                    if success {
                        self.navigationController?.popViewController(animated: true)
                        
                    }
                }
                
            }
            else {
                APIHandler.init().updateFriend(id: person.id,_friend: friend) { success in
                    if success {
                        self.lblTitle.text = "Update Friend"
                        self.navigationController?.popViewController(animated: true)
                        
                        
                    }
                }
            }
            
            txtFullName.text = ""
            txtNickName.text = ""
            txtPhone.text = ""
            
        }
        
    }
    
    
    
    
    
}
