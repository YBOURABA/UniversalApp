//
//  TabBar.swift
//  UniversalAppTest (iOS)
//
//  Created by Yahya BOURABA on 31/05/2021.
//

import SwiftUI

struct TabBar: View {
  var body: some View {
    TabView {
      ForEach(Category.allCases) { category in
        ItemsListView(viewModel: ItemsViewModel(category: category))
          .tabItem {
            Image(systemName: category.icon)
            Text(category.name)
          }
      }
    }
  }
}
