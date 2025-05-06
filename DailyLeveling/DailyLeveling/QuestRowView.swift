//
//  QuestRowView.swift
//  DailyLeveling
//
//  Created by Stefan Ganswint on 06.05.25.
//

import SwiftUI

struct QuestRowView: View {
    let quest: Quest

    var body: some View {
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
