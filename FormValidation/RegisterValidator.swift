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
    }
    struct Validator {
        var email: String?
        var password: String?
        var phone: String?
        mutating func setValue(email: String?, password: String?, phone: String?) {
            self.email = email
            self.password = password
            self.phone = phone
        }
        func check() -> ValidatorResult {
            guard let email = email else {
                return ValidatorResult(isValid: false, message: "Email can't be empty")
            }

            if email.isEmpty == true {
                return ValidatorResult(isValid: false, message: "Email can't be empty")
            }

            if email.isValidEmail() == false {
                return ValidatorResult(isValid: false, message: "Invalid email")
            }

            guard let password = password else {
                return ValidatorResult(isValid: false, message: "Password can't be empty")
            }

            if password.isEmpty == true {
                return ValidatorResult(isValid: false, message: "Password can't be empty")
            }

            if password.count < 6 {
                return ValidatorResult(isValid: false, message: "Password must have at least 6 characters")
            }

            guard let phone = phone else {
                return ValidatorResult(isValid: false, message: "Phone can't be empty")
            }

            if phone.isEmpty == true {
                return ValidatorResult(isValid: false, message: "Phone can't be empty")
            }

            return ValidatorResult(isValid: true, message: nil)
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
