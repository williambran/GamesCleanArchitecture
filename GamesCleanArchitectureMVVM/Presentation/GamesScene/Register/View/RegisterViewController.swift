//
//  RegisterViewController.swift
//  GamesCleanArchitectureMVVM
//
//  Created by wito on 13/04/22.
//

import UIKit

class RegisterViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var emailRegister: UITextField!
    @IBOutlet weak var nameRegister: UITextField!
    @IBOutlet weak var passwordRegister: UITextField!
    @IBOutlet weak var passwordRepedRegister: UITextField!

    
    @IBAction func buttonGoBackLogin(){
        //implementar el regreso al login
        self.viewModel.goBackToLogin()
    }
    
    
    @IBAction func buttonRegister(){
        //Lanzar registro
      //  self.viewModel.makeRegister(user: RegisterRequest(email: "willTest3@gmail.com", password: "12345678", names: "test desde API"))
        validateTexfield()
    }
    
    
    private var viewModel: RegisterViewModelInput!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Se crea RegisterViewController")
        setupView()
        // Do any additional setup after loading the view.
    }
    
    
    
    
   static func create(viewModel: RegisterViewModelInput) -> RegisterViewController {
        let view = RegisterViewController.instantiateVC( flow: "LoginViewController")
        view.viewModel = viewModel
        
        return view 
    }
    
    
    
    func setupView(){
        self.emailRegister.delegate = self
        self.nameRegister.delegate = self
        self.passwordRegister.delegate = self
        self.passwordRepedRegister.delegate = self
        
        
    }
    
    func validateTexfield(){
       let validatedEmail =  ValidationTextField(text: self.emailRegister.text, type: ValidationTextField.FieldType.email, options: nil)
        
        let isValidatedOK =  emailRegister.validate(validation: validatedEmail).success
        
        print("La validacion es \(isValidatedOK)")
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

// MARK: TextFildDelegate
extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) ->Bool {
     
        switch(textField){
        case emailRegister:
            print("se toco email textfield")
            //passwordRegister.resignFirstResponder()
            return true
        case nameRegister:
            print("se toco name textfield")
            return true
        case passwordRegister:
            print("se toco password textfield")
            return true
        case passwordRepedRegister:
            print("se toco passwordRepead textfield")
            return true
        default:
            return false
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch(textField){
        case emailRegister:
            print("comenzo a editarse email textfield")
            
        case nameRegister:
            print("comenzo a editarse textfield")
          
        case passwordRegister:
            print("comenzo a editarse textfield")
         
        case passwordRepedRegister:
            print("comenzo a editarse passwordRepead textfield")
            
        default:
            print("cdefauld")

        }
    }
    
}
