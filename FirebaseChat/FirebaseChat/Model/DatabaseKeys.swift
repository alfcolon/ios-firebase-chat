//
//  DatabaseKeys.swift
//  FirebaseChat
//
//  Created by Alfredo Colon on 11/29/20.
//

import Foundation

enum DatabasePaths {
    case messageID(id: String)
    case messageThreads
    case userID(id: String)
    case users
    
    var pathValue: String {
        switch self {
        case .messageID(let id):
            return "\(DatabasePaths.messageThreads.pathValue)\(id)/"
        case .messageThreads:
            return "messageThreads/"
        case .userID(let id):
            return "\(DatabasePaths.users.pathValue)\(id)/"
        case .users:
            return "users/"
        }
    }
    
}

enum UserKeys: String {
    case displayName
    case firstMessageThreadID
    case email
    case userID
}
