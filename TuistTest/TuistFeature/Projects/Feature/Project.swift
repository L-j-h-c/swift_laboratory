//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Junho Lee on 2022/09/18.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Feature",
    product: .staticFramework,
    dependencies: [
        .project(target: "Data", path: .relativeToRoot("Projects/Data")),
        .project(target: "Core", path: .relativeToRoot("Projects/Core")),
        .project(target: "DesignSystem", path: .relativeToRoot("Projects/DesignSystem"))
    ],
    resources: ["Resources/**"]
)
