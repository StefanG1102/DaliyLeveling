import Foundation

class QuestViewModel: ObservableObject {
    @Published var quests: [Quest] = [
        Quest(
            title: "Morning Routine",
            description: "Start your day strong",
            status: .active,
            reward: "10 XP",
            items: [
                QuestItem(name: "Drink Water", currentAmount: 0, requiredAmount: 1),
                QuestItem(name: "Make Bed", currentAmount: 0, requiredAmount: 1)
            ]
        ),
        Quest(
            title: "Daily Reading",
            description: "Read 20 pages of a book",
            status: .pending,
            reward: "15 XP",
            items: [
                QuestItem(name: "Read Pages", currentAmount: 5, requiredAmount: 20)
            ]
        )
    ]

    func updateItem(for questID: UUID, itemID: UUID, newAmount: Int) {
        guard let questIndex = quests.firstIndex(where: { $0.id == questID }),
              let itemIndex = quests[questIndex].items.firstIndex(where: { $0.id == itemID }) else {
            return
        }

        quests[questIndex].items[itemIndex].currentAmount = newAmount

        if quests[questIndex].progress >= 1.0 {
            quests[questIndex].status = .completed
        }
    }
}
