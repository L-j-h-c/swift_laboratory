import ProjectDescription

public extension Project {
    static let baseinfoPlist: [String: InfoPlist.Value] = [
        "CFBundleShortVersionString": "1.0.0",
        "CFBundleVersion": "1",
        "CFBundleIdentifier": "com.sopkaton.release",
        "CFBundleDisplayName": "sopkaton",
        "UILaunchStoryboardName": "LaunchScreen",
        "UIApplicationSceneManifest": [
            "UIApplicationSupportsMultipleScenes": false,
            "UISceneConfigurations": [
                "UIWindowSceneSessionRoleApplication": [
                    [
                        "UISceneConfigurationName": "Default Configuration",
                        "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                    ],
                ]
            ]
        ],
        "UIAppFonts": [
            // FIXME: - 폰트 추가 후 수정
            //                "Item 0": "Pretendard-Black.otf",
            //                "Item 1": "Pretendard-Bold.otf",
        ],
        "App Transport Security Settings": ["Allow Arbitrary Loads": true],
        "NSAppTransportSecurity": ["NSAllowsArbitraryLoads": true],
        "ITSAppUsesNonExemptEncryption": false
    ]
}
