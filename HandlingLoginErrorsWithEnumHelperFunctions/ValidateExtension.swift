//
//  ValidateExtension.swift
//  HandlingLoginErrorsWithEnumHelperFunctions
//
//  Created by Apple on 21/02/18.
//  Copyright © 2018 Vignesh. All rights reserved.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    
}
