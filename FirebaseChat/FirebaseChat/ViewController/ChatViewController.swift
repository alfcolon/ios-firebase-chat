//
//  DetailViewController.swift
//  FirebaseChat
//
//  Created by Alfredo Colon on 11/23/20.
//

import UIKit
import MessageKit

class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate  {

    //MARK: - Properties
    
    var chatRoom: ChatRoom!
    let testSender = Sender(senderId: "Gaga", displayName: "Lady Gaga")

    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
    
    //MARK: - Methods
    
    
    //MARK: - MessagesDataSource
    
    func currentSender() -> SenderType {
        return self.testSender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        let kind = MessageKind.text("test")
        let messageID = "44"
        let sender = self.testSender
        
        let currentTime: TimeInterval = CFAbsoluteTimeGetCurrent()
        let sentDate = Date(timeIntervalSince1970: currentTime)
        
        let message = Message(kind: kind, messageId: messageID, sender: sender, sentDate: sentDate)
        return message
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return 1
    }

}


