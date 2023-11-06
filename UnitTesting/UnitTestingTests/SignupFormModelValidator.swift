//
//  SignupFormModelValidator.swift
//  UnitTesting
//
//  Created by koala panda on 2023/11/06.
//

import Foundation


class SignupFormModelValidator{
    func isFirstNameValid(firstName: String) -> Bool{
        var returnValue = true
        
        if firstName.isEmpty{
            returnValue = false
        }
        
        return returnValue
    }
}
