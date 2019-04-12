//
//  Usuario.swift
//  Pinterest
//
//  Created by Alejandro Loza on 3/13/19.
//  Copyright © 2019 Alejandro Loza. All rights reserved.
//

import UIKit
class Usuario: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(firstButton)
        view.addSubview(usuarioTextField)
        
        view.backgroundColor = UIColor.white
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 30))
        label.center = CGPoint(x: 160, y: 160)
        label.textAlignment = .center
        label.font = UIFont (name: "HelveticaNeue-UltraLight", size: 20)
        label.text = "¿Cual sera su nombre de Usuario?"
        self.view.addSubview(label)
        
        
        usuarioTextField.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        usuarioTextField.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
        usuarioTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        usuarioTextField.widthAnchor.constraint(equalTo: label.widthAnchor, constant: -30).isActive = true
        
        firstButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
    }
    
    lazy var firstButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 200/255, green: 35/255, blue: 44/255, alpha: 1)
        ub.setTitle("Siguiente", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return ub
    }()
    
    @objc func handleButton (){
        let view = CollectionViewController()
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    let usuarioTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        tf.leftView = paddingView
        tf.leftViewMode = .always
        tf.font = UIFont (name: "AlNile-Bold", size: 40)
        tf.placeholder = "Usuario"
        tf.backgroundColor = .white
        return tf
    }()
    
}
