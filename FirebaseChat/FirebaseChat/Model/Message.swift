//
//  Message.swift
//  FirebaseChat
//
//  Created by Alfredo Colon on 11/23/20.
//

import Foundation
import MessageKit

struct Message: MessageType {
    
    //MARK: - Properies
    
    var displayDate: Bool
    var kind: MessageKind
    var prevMessageID: Int?
    var messageId: String // which is a unique String identifier for the message.
    var nextMessageID: Int?
    var sender: SenderType // To determine if a message was sent by the current user or to the current user.
    var sentDate: Date //  which represents the Date that each message was sent.
}
