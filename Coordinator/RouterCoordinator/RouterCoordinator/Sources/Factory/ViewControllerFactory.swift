//
//  ViewControllerFactory.swift
//  RouterCoordinator
//
//  Created by Junho Lee on 2022/09/29.
//

import Foundation

protocol AuthViewControllerFactory {
    func instantiateChooseLoginRegisterViewController() -> ChooseLoginRegisterViewController
    func instantiateLoginViewController() -> LoginViewController
    func instantiateRegisterViewController() -> RegisterViewController
    func instantiateTermsAndConditionsViewController() -> TermsAndConditionsViewController
}

protocol WalktroughViewControllerFactory {
    func instantiateWalktroughViewController() -> WalktroughViewController
}
