//
//  LoginViewController.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 18/01/22.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {
    
    
    private var viewModel: LoginViewModelInput!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.makeLogin(user: LoginRequest(email: "p@gmail.com", password: "12345678"))

    }
    

    static func create(viewModel: LoginViewModelInput)-> LoginViewController{
        let view = LoginViewController.instantiateVC()
        view.viewModel = viewModel
        
        return view
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // test Pedir peticion
     
        
    }

    
    
    
    // MARK: - Navigation



    
    
    deinit{
        print("Se librero memoria")
    }

}
