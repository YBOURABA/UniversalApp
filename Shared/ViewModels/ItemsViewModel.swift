//
//  ItemsViewModel.swift
//  UniversalAppTest (iOS)
//
//  Created by Yahya BOURABA on 31/05/2021.
//

import Foundation

import Combine
import Foundation

public class ItemsViewModel: ObservableObject {
  var subscriptions: Set<AnyCancellable> = []
  private let category: Category
  
  @Published var loading: Bool = true
  @Published var error: HackerNewsError?
  @Published var items: [ItemViewModel] = []

  init(category: Category) {
    self.category = category
  }
  
  func reload() {
    HackerNews
      .loadItems(in: category)
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { [weak self] value in
        guard let self = self else { return }
        if case let .failure(error) = value {
          self.error = error
        }
        self.loading = false
      }, receiveValue: { [weak self] items in
        guard let self = self else { return }
        self.items = items
      })
      .store(in: &subscriptions)
  }
}
