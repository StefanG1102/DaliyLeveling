//
//  Item.swift
//  DailyLeveling
//
//  Created by Stefan Ganswint on 06.05.25.
//

import Foundation

struct QuestItem: Identifiable, Codable {
    let id = UUID()
    var name: String
    var currentAmount: Int
    var requiredAmount: Int
}
