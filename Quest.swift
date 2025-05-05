//
//  Quest.swift
//  
//
//  Created by Stefan Ganswint on 05.05.25.
//

// Quest.swift
import Foundation

enum QuestStatus: String, Codable {
    case pending
    case active
    case completed
    case failed
}

struct Quest: Identifiable, Codable {
    let id: UUID
    var title: String
    var description: String
    var status: QuestStatus
    var reward: String
    var progress: Double // 0.0 to 1.0
}
