//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Junho Lee on 2022/09/18.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "App",
    platform: .iOS,
    product: .app,
    dependencies: [
        .project(target: "Feature", path: .relativeToRoot("Projects/Feature"))
    ],
    resources: ["Resources/**"],
    infoPlist: .extendingDefault(with: [
        "CFBundleShortVersionString": "1.0",
        "CFBundleVersion": "1",
        "UIMainStoryboardFile": "",
        "UILaunchStoryboardName": "LaunchScreen",
        "NSAppTransportSecurity" : ["NSAllowsArbitraryLoads":true],
        "UISupportedInterfaceOrientations" : ["UIInterfaceOrientationPortrait"],
        "UIUserInterfaceStyle":"Dark",
        "UIApplicationSceneManifest" : ["UIApplicationSupportsMultipleScenes":true,
                                        "UISceneConfigurations":[
                                            "UIWindowSceneSessionRoleApplication":[[
                                                "UISceneConfigurationName":"Default Configuration",
                                                "UISceneDelegateClassName":"$(PRODUCT_MODULE_NAME).SceneDelegate"
                                            ]]
                                        ]
                                       ],
        "ENABLE_TESTS": .boolean(true),
    ])
)
