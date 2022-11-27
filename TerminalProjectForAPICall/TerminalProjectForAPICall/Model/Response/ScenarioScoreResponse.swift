//
//  ScenarioScoreResponse.swift
//  TerminalProjectForAPICall
//
//  Created by Junho Lee on 2022/11/27.
//

import Foundation

struct ScenarioScoreResponse: Codable {
    let status: String
    let efficiencyScore, accuracyScore1: Int
    let accuracyScore2, score: Double

    enum CodingKeys: String, CodingKey {
        case status
        case efficiencyScore = "efficiency_score"
        case accuracyScore1 = "accuracy_score1"
        case accuracyScore2 = "accuracy_score2"
        case score
    }
}
