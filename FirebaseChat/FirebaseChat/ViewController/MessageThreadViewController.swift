//
//  ChatRoomViewController.swift
//  FirebaseChat
//
//  Created by Alfredo Colon on 11/23/20.
//

import UIKit
import MessageKit

class MessageThreadViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate  {

    //MARK: - Properties

    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
    
    //MARK: - Methods
    
    
    //MARK: - MessagesDataSource

    let sender = User(displayName: "", email: "", firstMessageThreadID: 0, senderId: "0")
    func currentSender() -> SenderType {
        return User(displayName: "", email: "", firstMessageThreadID: 0, senderId: "0")
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return Message(displayDate: false, kind: .text("0"), prevMessageID: 0, messageId: "3", nextMessageID: 0, sender: sender, sentDate: NSDate(timeIntervalSince1970: TimeInterval(1)) as Date)
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return 1
    }
}


