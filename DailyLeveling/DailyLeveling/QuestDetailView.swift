import SwiftUI

struct QuestDetailView: View {
    var quest: Quest

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(quest.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(quest.description)
                    .font(.body)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Progress")
                        .font(.headline)

                    ProgressView(value: quest.progress)
                        .tint(.blue)
                }

                HStack {
                    Label("Status", systemImage: "checkmark.circle")
                    Spacer()
                    Text(quest.status.rawValue.capitalized)
                        .foregroundColor(.secondary)
                }

                HStack {
                    Label("Reward", systemImage: "gift")
                    Spacer()
                    Text(quest.reward)
                        .foregroundColor(.orange)
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Quest Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
