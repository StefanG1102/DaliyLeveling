import Foundation

enum QuestStatus: String, CaseIterable, Codable {
    case pending, active, completed
}

struct Quest: Identifiable, Codable {
    let id = UUID()
    var title: String
    var description: String
    var status: QuestStatus
    var reward: String
    var progress: Double
}
