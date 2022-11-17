import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "sopkaton",
    platform: .iOS,
    product: .app,
    dependencies: [
        .SPM.SnapKit,
        .SPM.Kingfisher,
        .SPM.Then,
        .SPM.Moya,
        .SPM.RxSwift,
        .SPM.RxCocoa
    ],
    resources: ["Resources/**"],
    infoPlist: .extendingDefault(with: Project.baseinfoPlist)
)
