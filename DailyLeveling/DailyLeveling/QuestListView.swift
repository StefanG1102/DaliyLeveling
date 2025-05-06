import SwiftUI

struct QuestListView: View {
    @ObservedObject var viewModel = QuestViewModel()

    var body: some View {
        NavigationStack {
            List {
                // Active & Pending Quests
                Section(header: Text("Current Quests")) {
                    let currentQuests = viewModel.quests.filter {
                        $0.status == .active || $0.status == .pending
                    }

                    if currentQuests.isEmpty {
                        Text("No active quests")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(currentQuests) { quest in
                            NavigationLink(
                                destination: QuestDetailView(viewModel: viewModel, quest: quest)
                            ) {
                                QuestRowView(quest: quest)
                            }
                        }
                    }
                }

                // Completed Quests
                Section(header: Text("Completed")) {
                    let completedQuests = viewModel.quests.filter { $0.status == .completed }

                    if completedQuests.isEmpty {
                        Text("No quests completed yet")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(completedQuests) { quest in
                            QuestRowView(quest: quest)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Daily Quests")
        }
    }
}
