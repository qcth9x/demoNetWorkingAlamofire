//
//  ConversationsViewController.swift
//  DemoNetWorkingWithAlamofire
//
//  Created by Lê Đình Linh on 26/06/2023.
//

import UIKit
import Kingfisher

class ConversationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblConversations: UITableView!
    
    var conversationsData: [ConversationResponseModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tblConversations.dataSource = self
        tblConversations.delegate = self
        tblConversations.register(UINib(nibName: "ConversationTableViewCell", bundle: nil), forCellReuseIdentifier: "ConversationCellIdentifier")
        callAPIGetConversations()
        
    }
    
    func callAPIGetConversations() {
        APIHandler.init().getConversations{ conversationResponData in
            self.conversationsData = conversationResponData
            self.tblConversations.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversationsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblConversations.dequeueReusableCell(withIdentifier: "ConversationCellIdentifier") as! ConversationTableViewCell
        cell.lblNameUser.text = conversationsData[indexPath.row].name
        
        let avtURL = URL(string: conversationsData[indexPath.row].avatar)
        
        cell.imgAvt.kf.setImage(with: avtURL)
        
        return cell
    }
    
    
}
