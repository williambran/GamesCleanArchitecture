//
//  RegisterViewController.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 13/04/22.
//

import UIKit

class RegisterViewController: UIViewController, Storyboarded {
    
    
    
    @IBAction func buttonGoBackLogin(){
        //implementar el regreso al login
        self.viewModel.goBackToLogin()
    }
    
    
    @IBAction func buttonRegister(){
        //Lanzar registro
        self.viewModel.makeRegister(user: RegisterRequest(email: "willTest2@gmail.com", password: "12345678", names: "test desde API"))
    }
    
    
    private var viewModel: RegisterViewModelInput!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Se crea RegisterViewController")
        // Do any additional setup after loading the view.
    }
    
    
    
    
   static func create(viewModel: RegisterViewModelInput) -> RegisterViewController {
        let view = RegisterViewController.instantiateVC( flow: "LoginViewController")
        view.viewModel = viewModel
        
        return view 
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    deinit {
        print("Registercontroller deinit")
    }

}
