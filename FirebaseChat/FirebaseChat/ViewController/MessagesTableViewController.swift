//
//  MainTableViewController.swift
//  FirebaseChat
//
//  Created by Alfredo Colon on 11/23/20.
//

import UIKit
import MessageKit

class MessagesTableViewController: UITableViewController {

    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! MessageThreadViewController
        
    }
    
    //MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageThreadPreview", for: indexPath) as! MessageThreadPreviewTableViewCell
        
        cell.messageLabel.text = "Test"
        
        return cell
    }
}

