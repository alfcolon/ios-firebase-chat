//
//  FirebaseController.swift
//  FirebaseChat
//
//  Created by Alfredo Colon on 11/29/20.
//

import Firebase
import Foundation

class FirebaseController {
    
    //MARK: - Singleton
    
    static var shared = FirebaseController()
    
    //MARK: - Properties
    
    let ref: DatabaseReference
    
    //MARK: - Init
    
    init() {
        self.ref = Database.database().reference()
    }
    
    //MARK: - Methods
    
    //MARK: - Email
    
    func addUser(user: User) {
        let values: [String: Any] = [
            UserKeys.displayName.rawValue: user.displayName,
            UserKeys.email.rawValue: user.email,
            UserKeys.firstMessageThreadID.rawValue: user.firstMessageThreadID,
            UserKeys.userID.rawValue: user.senderId
        ]
        let pathValue: String = DatabasePaths.userID(id: user.senderId).pathValue
        self.ref.child(pathValue).setValue(values) {
            (error:Error?, ref:DatabaseReference) in
            if let error = error {
              print("Data could not be saved: \(error).")
            } else {
              print("Data saved successfully!")
            }
        }
    }
    
    func getUser(from userID: String, completetion: @escaping (_ user: User?) -> Void) {
        let userIDRef = self.ref.child(DatabasePaths.users.pathValue).child(userID)
        userIDRef.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let value = snapshot.value as? NSDictionary else { return completetion(nil) }
            let user = User(
                displayName: value[UserKeys.displayName.rawValue] as? String ?? "",
                email: value[UserKeys.email.rawValue] as? String ?? "",
                firstMessageThreadID: value[UserKeys.firstMessageThreadID.rawValue] as? Int ?? 0,
                senderId: value[UserKeys.userID.rawValue] as? String ?? ""
            )
            completetion(user)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func verifyCharacters(for userID: String) -> Bool {
        // check username for invalid ascii values
        // 48 - 57 numbers
        // 65 - 90 uppercase letters
        var ampersandReached: Bool = false
        var periodPostAmpersandReached: Bool = false
        
        var index: Int = 0
        for character in userID {
            guard let asciiValue = character.asciiValue else { return false }
            
            switch asciiValue {
            case 44: // ampersand reached
                guard ampersandReached == false else { return false }
                ampersandReached = true
            case 95: // period reached
                if ampersandReached {
                    guard periodPostAmpersandReached == false else { return false }
                    periodPostAmpersandReached = true
                }
            default:
                guard (asciiValue >= 48 && asciiValue <= 57) || (asciiValue >= 65 && asciiValue <= 90) else { return false }
            }
            
            index += 1
        }
        return true
    }
    
    func verify(userID: String, completition: @escaping (_ response: UserID) -> Void) {
        guard self.verifyCharacters(for: userID) else { return completition(.invalidCharacters) }
        
        let userIDRef = self.ref.child(DatabasePaths.users.pathValue).child(userID)
        userIDRef.observeSingleEvent(of: .value, with: { (snapshot) in
            completition(snapshot.exists() ? .exists : .doesNotExist)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    
    func userID(from email: String) -> String {
        var email = email.uppercased()
        email = email.replacingOccurrences(of: "@", with: ",")
        email = email.replacingOccurrences(of: ".", with: "_")
        
        return email
    }
}
