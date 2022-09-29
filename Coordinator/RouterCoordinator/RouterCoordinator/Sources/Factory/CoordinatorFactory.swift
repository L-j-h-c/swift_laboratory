//
//  CoordinatorFactory.swift
//  RouterCoordinator
//
//  Created by Junho Lee on 2022/09/29.
//

import UIKit

protocol CoordinatorFactoryProtocol {
    func instantiateApplicationCoordinator() -> ApplicationCoordinator
    func instantiateAuthCoordinator(router: RouterProtocol) -> AuthCoordinator
    func instantiateWalktroughCoordinator(router: RouterProtocol) -> WalktroughCoordinator
}

