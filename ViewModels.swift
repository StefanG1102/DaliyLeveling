//
//  ViewModels.swift
//  
//
//  Created by Stefan Ganswint on 05.05.25.
//

// QuestViewModel.swift
import Foundation
import Combine

class QuestViewModel: ObservableObject {
    @Published var quests: [Quest] = []

    init() {
        loadSampleQuests()
    }

    func loadSampleQuests() {
        quests = [
            Quest(id: UUID(), title: "Defeat 10 Goblins", description: "Eliminate 10 goblins in the forest.", status: .pending, reward: "500 XP", progress: 0.0),
            Quest(id: UUID(), title: "Collect Mana Crystals", description: "Collect 5 mana crystals from dungeon.", status: .active, reward: "300 XP", progress: 0.4)
        ]
    }

    func updateProgress(for quest: Quest, value: Double) {
        if let index = quests.firstIndex(where: { $0.id == quest.id }) {
            quests[index].progress = value
            if value >= 1.0 {
                quests[index].status = .completed
            }
        }
    }
}
