//
//  PersonalModel.swift
//  Enemy losses
//
//  Created by Евгений Воронов on 23.07.2022.
//

import SwiftUI

struct PersonalModel: Codable{
    var date: String
    var day: Int
    var personnel: Int
    var more: String
    var pow: Int?
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case day = "day"
        case personnel = "personnel"
        case more = "personnel*"
        case pow = "POW"
    }
}


