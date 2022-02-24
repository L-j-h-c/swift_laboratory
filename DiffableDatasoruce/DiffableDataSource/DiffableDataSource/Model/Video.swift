//
//  Video.swift
//  DiffableDataSource
//
//  Created by Junho Lee on 2022/02/23.
//

import UIKit

class Video: Hashable {
    var id = UUID()
    var title: String
    var lessonCount: Int
    
    init(title: String, lessonCount: Int) {
        self.title = title
        self.lessonCount = lessonCount
    }
    
    func hash(into hasher: inout Hasher) {
      // 2
      hasher.combine(id)
    }
    // 3
    static func == (lhs: Video, rhs: Video) -> Bool {
      lhs.id == rhs.id
    }
}

// MARK: - Video Sample Data
extension Video {
    static let allVideos = [
        Video(
            title: "SwiftUI",
            lessonCount: 37
        ),
        Video(
            title: "Data Structures",
            lessonCount: 29
        ),
        Video(
            title: "Algorithms in Swift",
            lessonCount: 29
        ),
        Video(
            title: "Beginning ARKit",
            lessonCount: 46
        ),
        Video(
            title: "Fastlane for iOS",
            lessonCount: 44
        ),
        Video(
            title: "Machine Learning",
            lessonCount: 15
        ),
        Video(
            title: "Beginning RxSwift",
            lessonCount: 39
        ),
        Video(
            title: "Demystifying Views",
            lessonCount: 26
        ),
        Video(
            title: "Push Notifications",
            lessonCount: 33
        ),
        Video(
            title: "Reproducing Popular",
            lessonCount: 31
        ),
        Video(
            title: "Potato",
            lessonCount: 13
        ),
        Video(
            title: "Banana",
            lessonCount: 7
        ),
        Video(
            title: "Hamburger",
            lessonCount: 4
        ),
        Video(
            title: "Apartment",
            lessonCount: 18
        ),
        Video(
            title: "Chocolate",
            lessonCount: 23
        ),
        Video(
            title: "Grapes",
            lessonCount: 11
        ),
        Video(
            title: "Apple",
            lessonCount: 1
        ),
        Video(
            title: "Galuxy",
            lessonCount: 5
        ),
        Video(
            title: "haluxy",
            lessonCount: 12
        ),
        Video(
            title: "iluxy",
            lessonCount: 34
        ),
        Video(
            title: "qwerty",
            lessonCount: 55
        ),
        Video(
            title: "Name",
            lessonCount: 72
        ),
        Video(
            title: "Table",
            lessonCount: 11
        ),
        Video(
            title: "Star",
            lessonCount: 36
        ),
        Video(
            title: "Frame",
            lessonCount: 42
        ),
        Video(
            title: "Restore",
            lessonCount: 73
        ),
        Video(
            title: "weather",
            lessonCount: 36
        ),
        Video(
            title: "Instance",
            lessonCount: 15
        ),
        Video(
            title: "Clover",
            lessonCount: 32
        ),
        Video(
            title: "Industry",
            lessonCount: 22
        ),
        Video(
            title: "Android",
            lessonCount: 23
        ),
        Video(
            title: "Refresh",
            lessonCount: 18
        ),
        Video(
            title: "Change",
            lessonCount: 1
        ),
        Video(
            title: "queen",
            lessonCount: 32
        ),
        Video(
            title: "Start",
            lessonCount: 4
        ),
        Video(
            title: "School",
            lessonCount: 6
        )
    ]
}
