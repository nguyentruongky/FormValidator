//
//  RegisterValidator.swift
//  FormValidation
//
//  Created by Ky Nguyen on 5/6/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import UIKit
extension RegisterController {
    struct ValidatorResult {
        var isValid = true
        var message: String?
        var textField: UITextField?
    }
    struct Validator {
        var email: String? {
            return emailTextField?.text
        }
        var password: String? {
            return passwordTextField?.text
        }
        var phone: String? {
            return phoneTextField?.text
        }

        private var emailTextField: UITextField?
        private var passwordTextField: UITextField?
        private var phoneTextField: UITextField?

        mutating func setFactors(email: UITextField, password: UITextField, phone: UITextField) {
            self.emailTextField = email
            self.passwordTextField = password
            self.phoneTextField = phone
        }
        func check() -> ValidatorResult {
            guard let email = email else {
                return ValidatorResult(isValid: false,
                                       message: "Email can't be empty",
                                       textField: emailTextField)
            }

            if email.isEmpty == true {
                return ValidatorResult(isValid: false,
                                       message: "Email can't be empty",
                                       textField: emailTextField)
            }

            if email.isValidEmail() == false {
                return ValidatorResult(isValid: false,
                                       message: "Invalid email",
                                       textField: emailTextField)
            }

            guard let password = password else {
                return ValidatorResult(isValid: false,
                                       message: "Password can't be empty",
                                       textField: passwordTextField)
            }

            if password.isEmpty == true {
                return ValidatorResult(isValid: false,
                                       message: "Password can't be empty",
                                       textField: passwordTextField)
            }

            if password.count < 6 {
                return ValidatorResult(isValid: false,
                                       message: "Password must have at least 6 characters",
                                       textField: passwordTextField)
            }

            guard let phone = phone else {
                return ValidatorResult(isValid: false,
                                       message: "Phone can't be empty",
                                       textField: phoneTextField)
            }

            if phone.isEmpty == true {
                return ValidatorResult(isValid: false,
                                       message: "Phone can't be empty",
                                       textField: phoneTextField)
            }

            return ValidatorResult(isValid: true,
                                   message: nil,
                                   textField: nil)
        }
    }
}

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}

extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}
