//
//  SignInViewController.swift
//  FirebaseChat
//
//  Created by Alfredo Colon on 11/28/20.
//

import UIKit

class SignInViewController: UIViewController {
    
    //MARK: - Properties
    
    var user: User?

    //MARK: - IBOutlets

    @IBOutlet var emailTextField: UITextField!

    //MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch segue.identifier {
        case "CreateAccountSegue":
            let destination = segue.destination as! CreateAccountViewController
            destination.signinDelegate = self
        case "MessagesTableViewControllerSegue":
            print("preparing for segue")
            guard let email = self.emailTextField.text else { return }
            let destination = segue.destination as! MessagesTableViewController
            destination.messageThreadPreviews = MessageThreadPreviewsController(email: email)
        default:
            break
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        guard identifier == "MessagesTableViewControllerSegue" else { return true }
        return self.user == nil ? false : true
    }
    
    //MARK: - IBActions
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        guard let email = self.emailTextField.text else { return }
        
        let userID = FirebaseController.shared.userID(from: email)
        
        FirebaseController.shared.verify(userID: userID, completition: { (response) in
            switch response {
            case .doesNotExist:
                self.present(response.alertController, animated: true, completion: nil)
            case .exists:
                FirebaseController.shared.getUser(from: userID, completetion: { (user) in
                    guard user != nil else { return }
                    self.user = user
                    print("email exists and user updated, segue should happen")
                    self.performSegue(withIdentifier: "MessagesTableViewControllerSegue", sender: nil)
                })
            case .invalidCharacters:
                self.present(response.alertController, animated: true, completion: nil)
            }
        })
    }
}
