//
//  ItemView.swift
//  UniversalAppTest (iOS)
//
//  Created by Yahya BOURABA on 31/05/2021.
//

import SwiftUI

struct ItemView: View {
  @ObservedObject var viewModel: ItemViewModel

  @ViewBuilder
  var body: some View {
    if viewModel.loading {
      ProgressView()
        .onAppear(perform: { viewModel.reload() })
    } else if let error = viewModel.error {
      Label(error.description, systemImage: "exclamationmark.triangle")
    } else if let item = viewModel.item {
      Link(destination: item.url) {
        VStack(alignment: .leading) {
          Text(item.title)
            .font(.headline)
            .lineLimit(3)
          HStack {
            Text("\(item.score) points · by \(item.author) · \(item.formattedDate)")
              .font(.caption)
              .foregroundColor(.gray)
          }
        }
      }
      .padding(.vertical, 4)
    }
  }
}
