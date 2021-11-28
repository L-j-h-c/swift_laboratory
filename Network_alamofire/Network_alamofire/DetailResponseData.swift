import Foundation

// MARK: - Welcome
struct DetailResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: DetailResultData?
}

// MARK: - DataClass
struct DetailResultData: Codable {
    let bookInfoList: BookInfoList
    let reviewList: [ReviewList]
}

// MARK: - BookInfoList
struct BookInfoList: Codable {
    let completePercent: Int
    let bookImg: String
    let bookName, author, userStorage: String
    let postCount: Int
    let bookInfoListDescription, category: String
    let reviewPoint: Int
    let postSize, createdAt, updatedAt: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case completePercent, bookImg, bookName, author, userStorage, postCount
        case bookInfoListDescription = "description"
        case category, reviewPoint, postSize, createdAt, updatedAt, id
    }
}

// MARK: - ReviewList
struct ReviewList: Codable {
    let id: Int
    let userImg: String?
    let nickname: String
    let createdAt, updatedAt: String?
    let contents: String
    let likeCount: Int
}

// MARK: - Welcome
struct likeCountResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: likeCountClass?
}

// MARK: - DataClass
struct likeCountClass: Codable {
    let like: Int
}
