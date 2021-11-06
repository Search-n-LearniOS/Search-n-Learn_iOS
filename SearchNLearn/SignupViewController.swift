//
//  SignupViewController.swift
//  SignupViewController
//
//  Created by Alex Henner on 11/5/21.
//

import UIKit
import Parse
import AlamofireImage

class SignupViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var BioTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ProfileImage.layer.borderWidth = 1
//        ProfileImage.layer.masksToBounds = false
        ProfileImage.layer.borderColor = UIColor.black.cgColor
        ProfileImage.layer.cornerRadius = ProfileImage.frame.width/6
//        ProfileImage.layer.cornerRadius = ProfileImage.frame.height/2
        ProfileImage.clipsToBounds = true
    }
    @IBAction func OnCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func OnSignup(_ sender: Any) {
        let user = PFUser()
        user.username = EmailTextField.text
        user.password = PasswordTextField.text
        user.email = EmailTextField.text
        user["firstName"] = FirstNameTextField.text
        user["lastName"] = LastNameTextField.text
        user["bio"] = BioTextView.text
        
        let imageData = ProfileImage.image!.pngData()
        let file = PFFileObject(data: imageData!)
        
        user["profilePic"] = file
        
        user.signUpInBackground { success, error in
            if success {
                self.performSegue(withIdentifier: "SignupSegue", sender: nil)
            } else {
                print("Signup Failed")
            }
        }
    }
    
    @IBAction func OnProfilePicButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 150, height: 150)
        let scaledImage = image.af.imageScaled(to: size)
        
        ProfileImage.image = scaledImage
        dismiss(animated: true, completion: nil)
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
