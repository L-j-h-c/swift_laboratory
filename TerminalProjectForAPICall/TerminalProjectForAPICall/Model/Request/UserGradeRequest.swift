//
//  UserGradeRequest.swift
//  TerminalProjectForAPICall
//
//  Created by Junho Lee on 2022/11/27.
//

import Foundation

struct UserGrade: Codable {
    let id, grade: Int
}

typealias UserGradeRequest = [UserGrade]
