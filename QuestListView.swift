//
//  QuestListView.swift
//  
//
//  Created by Stefan Ganswint on 05.05.25.
//

// QuestListView.swift
import SwiftUI

struct QuestListView: View {
    @ObservedObject var viewModel = QuestViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.quests) { quest in
                NavigationLink(destination: QuestDetailView(quest: quest)) {
                    VStack(alignment: .leading) {
                        Text(quest.title).font(.headline)
                        ProgressView(value: quest.progress)
                        Text(quest.status.rawValue.capitalized).font(.caption).foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Quests")
        }
    }
}
