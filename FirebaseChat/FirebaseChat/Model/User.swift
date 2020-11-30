//
//  User.swift
//  FirebaseChat
//
//  Created by Alfredo Colon on 11/24/20.
//

import Foundation
import MessageKit

struct User: SenderType {

    //MARK: - Properties
    
    var displayName: String
    var email: String
    var firstMessageThreadID: Int
    var senderId: String
    
}
