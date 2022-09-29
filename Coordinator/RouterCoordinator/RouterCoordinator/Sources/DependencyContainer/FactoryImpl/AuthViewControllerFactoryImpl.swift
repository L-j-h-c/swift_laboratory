//
//  AuthViewControllerFactoryImpl.swift
//  RouterCoordinator
//
//  Created by Junho Lee on 2022/09/29.
//

import UIKit

extension DependencyContainer: AuthViewControllerFactory {
    
    func instantiateChooseLoginRegisterViewController() -> ChooseLoginRegisterViewController {
        let chooseLoginRegisterViewController = UIStoryboard.auth.instantiateViewController(withIdentifier: "ChooseLoginRegisterViewController") as! ChooseLoginRegisterViewController
        chooseLoginRegisterViewController.viewModel = ChooseLoginRegisterViewModel()
        return chooseLoginRegisterViewController
    }
    
    func instantiateLoginViewController() -> LoginViewController {
        let loginViewController = UIStoryboard.auth.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        loginViewController.viewModel = LoginViewModel(authServices: self.authNetworkServices)
        return loginViewController
    }
    
    func instantiateRegisterViewController() -> RegisterViewController {
        let registerViewController = UIStoryboard.auth.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        registerViewController.viewModel = RegisterViewModel(authServices: self.authNetworkServices)
        return registerViewController
    }
    
    func instantiateTermsAndConditionsViewController() -> TermsAndConditionsViewController {
        let termsAndConditionsViewController = UIStoryboard.auth.instantiateViewController(withIdentifier: "TermsAndConditionsViewController") as! TermsAndConditionsViewController
        termsAndConditionsViewController.viewModel = TermsAndConditionsViewModel()
        return termsAndConditionsViewController
    }
    
}
