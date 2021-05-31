//
//  UniversalAppTestApp.swift
//  Shared
//
//  Created by Yahya BOURABA on 31/05/2021.
//

import SwiftUI

@main
struct UniversalAppTestApp: App {
    var body: some Scene {
        WindowGroup {
             #if os(macOS)
             NavigationView {
               Sidebar()
               ItemsListView(viewModel: ItemsViewModel(category: .top))
             }
             #else
             NavigationView {
               TabBar()
                 .navigationTitle("Hacker News")
             }.navigationViewStyle(StackNavigationViewStyle())
             #endif
           }
    }
}
