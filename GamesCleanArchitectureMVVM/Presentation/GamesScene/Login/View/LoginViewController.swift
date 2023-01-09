//
//  LoginViewController.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 18/01/22.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {
    
    
    private var viewModel: LoginViewModelInput!
    
    
    
    @IBAction func buttonLogin(_ sender: Any) {
        //llevarme al otro viewcontoller
        self.viewModel.makeLogin()
    }
    
    @IBAction func buttonRegister(_ sender: Any) {
        self.viewModel.maeRegister()
    }

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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    
    // MARK: - Navigation



    
    
    deinit{
        print("loginViewController deinit")
    }

}
