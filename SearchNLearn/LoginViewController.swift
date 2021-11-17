//
//  LoginViewController.swift
//  SearchNLearn
//
//  Created by Jerrod on 11/3/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchNLearnAPICaller.getCritters()

        // Do any additional setup after loading the view.
    }
    @IBAction func OnSignin(_ sender: Any) {
        let username = UsernameTextField.text!
        let password = PasswordTextField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { user, error in
            if user != nil {
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            } else {
                print("Login error")
            }
        }
    }
    
    @IBAction func OnSignup(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
