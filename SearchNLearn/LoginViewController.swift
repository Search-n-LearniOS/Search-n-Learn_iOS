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
//        replace bear with the name of the animal at that cell from other API
        SearchNLearnAPICaller.getWikiDictionary(animalName: "american black bear") { (my_array: [Any]) in
            let title = my_array[0] as? String
            print(title)
            let imageUrl = my_array[1]
//            Use the imageVar.af.setImage(withURL: imageUrl!) to set image in views
        } failure: { error in
            print(error)
        }
        
        SearchNLearnAPICaller.getCritters () { (my_animal_array: [Any]) in
            
            print(my_animal_array)
            for animal in my_animal_array {
                print(animal)
                
            }
            
            } failure: { error in
                print(error)
            }
            
       
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
