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
    var items: [QuestItem]

    var progress: Double {
        let total = items.map { Double($0.requiredAmount) }.reduce(0, +)
        let done = items.map { Double($0.currentAmount) }.reduce(0, +)
        return total > 0 ? min(done / total, 1.0) : 0.0
    }
}
