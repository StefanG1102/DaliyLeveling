import SwiftUI

struct QuestDetailView: View {
    @ObservedObject var viewModel: QuestViewModel
    let quest: Quest

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                // Title Section
                VStack(spacing: 8) {
                    Text("⚠️ QUEST INFO")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.6))
                        .cornerRadius(10)
                    
                    Text("[Daily Quest: \(quest.title)]")
                        .foregroundColor(.cyan)
                        .fontWeight(.bold)
                        .padding(.bottom, 4)
                }

                Divider().background(Color.gray)

                // Goals Header
                Text("GOALS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                // Goal List
                ForEach(quest.items) { item in
                    HStack {
                        Text(item.name)
                            .foregroundColor(.white)

                        Spacer()

                        Text("[\(item.currentAmount)/\(item.requiredAmount)]")
                            .foregroundColor(.white)

                        Image(systemName: item.currentAmount >= item.requiredAmount ? "checkmark.square.fill" : "square")
                            .foregroundColor(item.currentAmount >= item.requiredAmount ? .green : .gray)
                    }
                    .padding(.vertical, 4)
                }

                Divider().background(Color.gray)

                // Warning
                Text("WARNING: Failure to complete the daily quest will result in an appropriate penalty.")
                    .font(.footnote)
                    .foregroundColor(.red)
                    .padding(.top, 8)

                Spacer()
            }
            .padding()
        }
        .background(
            LinearGradient(colors: [Color.black, Color.blue.opacity(0.4)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        )
        .navigationTitle("Quest Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
