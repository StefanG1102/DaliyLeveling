import SwiftUI

struct QuestListView: View {
    @ObservedObject var viewModel = QuestViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.quests) { quest in
                    NavigationLink(destination: QuestDetailView(quest: quest)) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(quest.title)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)

                            ProgressView(value: quest.progress)
                                .tint(quest.status == .completed ? .green : .blue)

                            HStack {
                                Text("Status: \(quest.status.rawValue.capitalized)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)

                                Spacer()

                                Text(quest.reward)
                                    .font(.caption)
                                    .foregroundColor(.orange)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Daily Quests")
        }
    }
}
