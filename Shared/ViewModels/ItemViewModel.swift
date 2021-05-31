//
//  ItemViewModel.swift
//  UniversalAppTest (iOS)
//
//  Created by Yahya BOURABA on 31/05/2021.
//

import Combine
import Foundation

class ItemViewModel: ObservableObject, Identifiable {
  var subscriptions: Set<AnyCancellable> = []
  let id: Int
  
  @Published var loading: Bool = true
  @Published var error: HackerNewsError?
  @Published var item: Item?
  
  init(id: Int) {
    self.id = id
  }
  
  func reload() {
    HackerNews
      .loadItem(withId: id)
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { [weak self] value in
        guard let self = self else { return }
        if case let .failure(error) = value {
          self.error = error
        }
        self.loading = false
      }, receiveValue: { [weak self] item in
        guard let self = self else { return }
        self.item = item
      })
      .store(in: &subscriptions)
  }
}

