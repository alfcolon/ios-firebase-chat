//
//  CreateAccountViewController.swift
//  FirebaseChat
//
//  Created by Alfredo Colon on 11/28/20.
//

import Firebase
import UIKit



class CreateAccountViewController: UIViewController {

    //MARK: - Delegate
    
    var signinDelegate: SignInViewController!
    
    //MARK: - IBOutlets
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBActions

    @IBAction func signUpButtonPressed(_ sender: Any) {
        guard let email = self.emailTextField.text else { return }
        guard let name = self.nameTextField.text else { return }

        let userID = FirebaseController.shared.userID(from: email)

        FirebaseController.shared.verify(userID: userID, completition: { (response) in
            switch response {
            case .doesNotExist:
                let user = User(
                    displayName: name, email: email,
                    firstMessageThreadID: 0,
                    senderId: userID)
                FirebaseController.shared.addUser(user: user)
                self.signinDelegate.user = user
                self.signinDelegate.performSegue(withIdentifier: "MessagesTableViewControllerSegue", sender: nil)
                self.dismiss(animated: true, completion: nil)
            case .exists:
                self.present(response.alertController, animated: true, completion: nil)
            case .invalidCharacters:
                self.present(response.alertController, animated: true, completion: nil)
            }
        })
    }
}
