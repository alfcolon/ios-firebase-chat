//
//  MessageThreadController.swift
//  FirebaseChat
//
//  Created by Alfredo Colon on 11/23/20.
//

import Firebase
import Foundation

class MessageThreadController {

    
    //MARK: - Properties
    
    
    var messageID: UUID
    var userID: UUID
    
    //MARK: - Init
    
    init(messageID: UUID, userID: UUID) {
        self.messageID = messageID
        self.userID = userID
    }
    
    //MARK: - Methods
    
//    Create a chat room in Firebase
    func createMessageThread() {
        
    }
//    Fetch chat rooms from Firebase
    func fetchMessageThread() {
        
    }
//    Create a message in a chat room in Firebase
    func createMessage() {
        
    }
//    Fetch messages in a chat room from Firebase
    func fetchMessage() {
        
    }
    
    func verify(email: String) {
        
    }

}
