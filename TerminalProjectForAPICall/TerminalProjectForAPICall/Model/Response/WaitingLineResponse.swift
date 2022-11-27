//
//  DreamWriteDTO.swift
//  RD-NetworkTests
//
//  Created by Junho Lee on 2022/10/14.
//  Copyright © 2022 RecorDream. All rights reserved.
//

struct WaitingLineResponse: Codable {
    let waitingLine: [WaitingLine]

    enum CodingKeys: String, CodingKey {
        case waitingLine = "waiting_line"
    }
}

struct WaitingLine: Codable {
    let id, from: Int
}
