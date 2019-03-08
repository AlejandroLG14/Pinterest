//
//  ViewController.swift
//  Pinterest
//
//  Created by Alejandro Loza on 2/7/19.
//  Copyright © 2019 Alejandro Loza. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        
        let imageName = "gold_star-512"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        //add subview
        view.addSubview(inputContainerView)
        view.addSubview(firstButton)
        view.addSubview(SecondButton)
        inputContainerView.addSubview(nameTextField)
        inputContainerView.addSubview(emailTextField)
        inputContainerView.addSubview(passwordTextField)
        
        
        //constraints
        // constraints for input
        
        imageView.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        view.addSubview(imageView)
        
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        
        
        firstButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 20).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstButton.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        firstButton.rightAnchor.constraint(equalTo: inputContainerView.rightAnchor).isActive = true
        
        
        SecondButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 20).isActive = true
        SecondButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        SecondButton.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        SecondButton.rightAnchor.constraint(equalTo: inputContainerView.rightAnchor).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    let emailTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        tf.placeholder = "Email"
        tf.backgroundColor = .white
        return tf
    }()
    
    let passwordTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        tf.placeholder = "Password"
        tf.backgroundColor = .white
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let nameTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        tf.placeholder = "Name"
        tf.backgroundColor = .white
        return tf
    }()
    
    let inputContainerView : UIView =  {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    
    lazy var firstButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        ub.setTitle("Register", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return ub
    }()
    
    lazy var SecondButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        let paddingView: UIView = UIView(frame: CGRect(x: 300, y: 100, width: 30, height: 20))
        ub.setTitle("Facebook", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return ub
    }()
    
    @objc func handleButton(){
        
        if let email = emailTextField.text, let pass = passwordTextField.text, let name = nameTextField.text{

            Auth.auth().createUser(withEmail: email, password: pass) { (data:AuthDataResult?, error) in
                let user = data?.user
                if error != nil {
                    
                    print(error.debugDescription)
                }
                //Succesful
                let ref = Database.database().reference(fromURL: "https://pinterest-8f963.firebaseio.com/")
                
                //Agregar ID
                if let uid = user?.uid{
                    let usersRef =
                        ref.child("users").child(uid)
                    usersRef.updateChildValues(["name" : name, "email" : email, "password" : pass])
                 
                    // Mensaje
                    let message = ref.child("message").child(uid)
                    message.updateChildValues(["message" : "Hola, esto es un mensaje"])
                    
                    // Delete
                    ref.child("message").child(uid).removeValue()
                    
                }
                
//                var usersRef = ref.child("users")
//                usersRef.updateChildValues(["name" : name, "email" : email, "password" : pass])
            }
        }
            
        }
    }

extension UIColor {
    
    convenience init(r:CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}
