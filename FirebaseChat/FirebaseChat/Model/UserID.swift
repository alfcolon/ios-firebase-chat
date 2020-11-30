//
//  UserID.swift
//  FirebaseChat
//
//  Created by Alfredo Colon on 11/29/20.
//

import UIKit

enum UserID {
    case doesNotExist
    case exists
    case invalidCharacters
    
    var alertController: UIAlertController {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        var alertController: UIAlertController!
        
        switch self {
        case .doesNotExist:
            alertController = UIAlertController(title: "Invalid Email", message: "Email does not exist", preferredStyle: .alert)
        case .exists:
            alertController = UIAlertController(title: "Invalid Email", message: "Email already exists", preferredStyle: .alert)
        case .invalidCharacters:
            alertController = UIAlertController(title: "Invalid Email", message: "Invalid characters", preferredStyle: .alert)
        }
        alertController.addAction(okAction)
        return alertController
    }
}
