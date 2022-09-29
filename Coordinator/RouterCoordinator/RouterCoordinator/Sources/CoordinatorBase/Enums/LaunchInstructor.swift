//
//  LaunchInstructor.swift
//  RouterCoordinator
//
//  Created by Junho Lee on 2022/09/29.
//

import Foundation

enum LaunchInstructor {
    
    case main
    case auth
    case onboarding
    
    // MARK: - Public methods
    
    static func configure(isAutorized: Bool = false, tutorialWasShown: Bool = false) -> LaunchInstructor {
        
        let isAutorized = isAutorized
        let tutorialWasShown = tutorialWasShown
        
//        if AuthUserDefaultsServices.shared().getToken() != nil {
//            isAutorized = true
//            tutorialWasShown = true
//        }
        
        switch (tutorialWasShown, isAutorized) {
            case (true, false), (false, false): return .auth
            case (false, true): return .onboarding
            case (true, true): return .main
        }
    }
}
Footer
© 2022 GitHub, Inc.
Footer navigation
Terms

