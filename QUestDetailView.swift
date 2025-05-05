//
//  QUestDetailView.swift
//  
//
//  Created by Stefan Ganswint on 05.05.25.
//

// QuestDetailView.swift
import SwiftUI

struct QuestDetailView: View {
    let quest: Quest

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(quest.title).font(.title)
            Text(quest.description)
            Text("Reward: \(quest.reward)")
            ProgressView(value: quest.progress)
            Text("Status: \(quest.status.rawValue.capitalized)")
            Spacer()
        }
        .padding()
        .navigationTitle("Quest Details")
    }
}
