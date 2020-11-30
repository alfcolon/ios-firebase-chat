//
//  MainTableViewController.swift
//  FirebaseChat
//
//  Created by Alfredo Colon on 11/23/20.
//

import UIKit
import MessageKit
import Firebase

class MessageThreadPreviewsController {
    
    //MARK: - Properties
    
    var email: String!
    var messageIDForLoading: Int!
    var messageThreadCount: Int!
    
    //MARK: - Init
    
    init(email: String) {
        self.email = email
//        
//        MessageThreadController.ref.child("user-email").child(self.email).observeSingleEvent(of: .value, with: { (snapshot) in
//            guard let value = snapshot.value as? NSDictionary else { return }
////
////            self.messageThreadCount = value["messageThreadCount"] as? Int ?? 0
////            self.messageIDForLoading = value["firstMessageThreadID"] as? Int ?? 0
//        }) { (error) in
//            print(error.localizedDescription)
//        }
    }
    
    //MARK: - Methods
    
    func updateProperties() {

    }
}
class MessagesTableViewController: UITableViewController {

    //MARK: - Properties
    
    var messageThreadPreviews: MessageThreadPreviewsController!

    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.hidesBackButton = true
        self.navigationItem.hidesBackButton = true
    }
    
    //MARK: - Methods

    private func setupMessages(for userEmail: String?) {

    }
    
    //MARK: - IBOutlets
    
    @IBAction func addMessageButtonTapped(_ sender: Any) {
        
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destination = segue.destination as! MessageThreadViewController
        
    }
    
    //MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
//        return self.user != nil ? 1 : 0
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.messageCount
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageThreadPreview", for: indexPath) as! MessageThreadPreviewTableViewCell
        
        cell.messageLabel.text = "Test"
        
        return cell
    }
}

