//
//  Category.swift
//  UniversalAppTest (iOS)
//
//  Created by Yahya BOURABA on 31/05/2021.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
  var id: String {
    return rawValue
  }

  case top
  case best
  case new
  case ask
  case show

  var name: String {
    switch self {
    case .best: return "Best"
    case .new: return "New"
    case .top: return "Top"
    case .ask: return "Ask HN"
    case .show: return "Show HN"
    }
  }

  var urlSuffix: String {
    return self.rawValue
  }

  var icon: String {
    switch self {
    case .best: return "rosette"
    case .new: return "clock"
    case .top: return "flame.fill"
    case .ask: return "questionmark.circle"
    case .show: return "eye"
    }
  }
}
