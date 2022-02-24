//
//  Section.swift
//  DiffableDataSource
//
//  Created by Junho Lee on 2022/02/23.
//

import Foundation

enum Section: Hashable {
  case main
}
//
//class Section: Hashable {
//  var id = UUID()
//  // 2
//  var title: String
//  // 3
//  var videos: [Video]
//  
//  init(title: String, videos: [Video]) {
//    self.title = title
//    self.videos = videos
//  }
//  // 4
//  func hash(into hasher: inout Hasher) {
//    hasher.combine(id)
//  }
//  
//  static func == (lhs: Section, rhs: Section) -> Bool {
//    lhs.id == rhs.id
//  }
//}
//
//extension Section {
//  static var allSections: [Section] = [
//    Section(title: "SwiftUI", videos: [
//        Video(
//            title: "SwiftUI",
//            lessonCount: 37
//        ),
//        Video(
//            title: "Data Structures",
//            lessonCount: 29
//        ),
//        Video(
//            title: "Algorithms in Swift",
//            lessonCount: 29
//        )
//    ]),
//    Section(title: "UIKit", videos: [
//        Video(
//            title: "Beginning ARKit",
//            lessonCount: 46
//        ),
//        Video(
//            title: "Fastlane for iOS",
//            lessonCount: 44
//            )
//    ]),
//    Section(title: "Frameworks", videos: [
//        Video(
//            title: "Machine Learning",
//            lessonCount: 15
//        ),
//        Video(
//            title: "Beginning RxSwift",
//            lessonCount: 39
//        ),
//        Video(
//            title: "Demystifying Views",
//            lessonCount: 26
//        )
//    ]),
//    Section(title: "Miscellaneous", videos: [
//        Video(
//            title: "Push Notifications",
//            lessonCount: 33
//        ),
//        Video(
//            title: "Reproducing Popular",
//            lessonCount: 31
//        ),
//        Video(
//            title: "Potato",
//            lessonCount: 13
//        ),
//        Video(
//            title: "Banana",
//            lessonCount: 7
//        ),
//        Video(
//            title: "Hamburger",
//            lessonCount: 4
//        )
//    ]),
//    Section(title: "Fruit", videos: [
//        Video(
//            title: "Apartment",
//            lessonCount: 18
//        ),
//        Video(
//            title: "Chocolate",
//            lessonCount: 23
//        ),
//        Video(
//            title: "Grapes",
//            lessonCount: 11
//        ),
//        Video(
//            title: "Apple",
//            lessonCount: 1
//        ),
//        Video(
//            title: "Galuxy",
//            lessonCount: 5
//        ),
//        Video(
//            title: "haluxy",
//            lessonCount: 12
//        )
//    ]),
//    Section(title: "Clover", videos: [
//        Video(
//            title: "iluxy",
//            lessonCount: 34
//        ),
//        Video(
//            title: "qwerty",
//            lessonCount: 55
//        ),
//        Video(
//            title: "Name",
//            lessonCount: 72
//        )
//    ]),
//    Section(title: "apple", videos: [
//        Video(
//            title: "queen",
//            lessonCount: 32
//        ),
//        Video(
//            title: "Start",
//            lessonCount: 4
//        ),
//        Video(
//            title: "School",
//            lessonCount: 6
//        )
//    ]),
//    Section(title: "apple", videos: [
//        Video(
//            title: "Table",
//            lessonCount: 11
//        ),
//        Video(
//            title: "Star",
//            lessonCount: 36
//        )
//    ])
//  ]
//}
