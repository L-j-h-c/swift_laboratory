import ProjectDescription

public enum Environment {
    public static let appBundleId = "com.sopkaton.release"
    public static let organizationName = "sopkaton"
    public static let deploymentTarget: DeploymentTarget = .iOS(targetVersion: "14.0", devices: [.iphone, .ipad])
}
