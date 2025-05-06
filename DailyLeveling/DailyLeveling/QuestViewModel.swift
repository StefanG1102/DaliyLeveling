import Foundation
import SwiftUI

class QuestViewModel: ObservableObject {
    @Published var quests: [Quest] = [
        Quest(title: "Defeat Goblins", description: "Eliminate 10 goblins", status: .active, reward: "500 XP", progress: 0.3),
        Quest(title: "Collect Mana Crystals", description: "Find 5 crystals in dungeon", status: .pending, reward: "300 XP", progress: 0.0),
        Quest(title: "Rescue the Mage", description: "Find the lost mage in Ice Cave", status: .completed, reward: "1000 XP", progress: 1.0)
    ]
}
