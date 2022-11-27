//
//  GameResultResponse.swift
//  TerminalProjectForAPICall
//
//  Created by Junho Lee on 2022/11/27.
//

import Foundation

struct GameResultResponse: Codable {
    let gameResult: [GameResult]

    enum CodingKeys: String, CodingKey {
        case gameResult = "game_result"
    }
}

// MARK: - GameResult
struct GameResult: Codable {
    let win, lose, taken: Int
}
