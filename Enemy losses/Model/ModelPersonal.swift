//
//  ModelPersonal.swift
//  Enemy losses
//
//  Created by Евгений Воронов on 23.07.2022.
//

import SwiftUI

struct ModelPersonal: Codable{
//    var id = UUID()
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


