//
//  Login.swift
//  Pinterest
//
//  Created by Alejandro Loza on 2/28/19.
//  Copyright © 2019 Alejandro Loza. All rights reserved.
//

import UIKit
import Firebase

class Login: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 249, g: 251, b: 255)
        
        let imageName = "LogoPin"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        //add subview
//        view.addSubview(inputContainerView)
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        view.addSubview(loginButton)
        

        //constraints
        // constraints for input
        
        imageView.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        view.addSubview(imageView)
        

        firstButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        
        secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10).isActive = true
        secondButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        secondButton.leftAnchor.constraint(equalTo: firstButton.leftAnchor).isActive = true
        secondButton.rightAnchor.constraint(equalTo: firstButton.rightAnchor).isActive = true
        
        thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 10).isActive = true
        thirdButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        thirdButton.leftAnchor.constraint(equalTo: secondButton.leftAnchor).isActive = true
        thirdButton.rightAnchor.constraint(equalTo: secondButton.rightAnchor).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: thirdButton.bottomAnchor, constant: 125).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.leftAnchor.constraint(equalTo: thirdButton.leftAnchor).isActive = true
        loginButton.rightAnchor.constraint(equalTo: thirdButton.rightAnchor).isActive = true
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    lazy var firstButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 200/255, green: 35/255, blue: 44/255, alpha: 1)
        ub.setTitle("Continuar con E-mail", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return ub
    }()
    
    lazy var secondButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        ub.setTitle("Continuar con Facebook", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        return ub
    }()
    
    @objc func handleButton (){
        let correo = Correo()
        self.navigationController?.pushViewController(correo, animated: true)
    }
    
    lazy var thirdButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 153/255, green: 186/255, blue: 239/255, alpha: 1)
        ub.setTitle("Continuar con Google", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        return ub
    }()
    
    lazy var loginButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        ub.setTitle("Inicias Sesion", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        return ub
    }()
}
