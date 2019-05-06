//
//  ViewController.swift
//  FormValidation
//
//  Created by Ky Nguyen on 5/5/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!

    var validator = Validator()
    @IBAction func registerAccount(_ sender: Any) {
        validator.setFactors(email: emailTextField,
                           password: passwordTextField,
                           phone: phoneTextField)
        let result = validator.check()
        if result.isValid == false, let message = result.message {
            result.textField?.becomeFirstResponder()
            result.textField?.shake()
            showMessage(message: message)
            return
        }

        callRegisterApi(email: validator.email!,
                        password: validator.password!,
                        phone: validator.phone!)
    }

    func showMessage(message: String) {
        let controller = UIAlertController(title: "", message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .default))
        present(controller, animated: true)
        return
    }

    func callRegisterApi(email: String, password: String, phone: String) {
        // run api here
        showMessage(message: "Api calling. Give me seconds")
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

