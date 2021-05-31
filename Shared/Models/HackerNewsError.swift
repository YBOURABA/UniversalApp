//
//  HackerNewsError.swift
//  UniversalAppTest (iOS)
//
//  Created by Yahya BOURABA on 31/05/2021.
//

import Foundation

enum HackerNewsError: Error {
  case message(String)
  case other(Error)

  static func map(_ error: Error) -> HackerNewsError {
    return (error as? HackerNewsError) ?? .other(error)
  }
}

extension HackerNewsError: CustomStringConvertible {
  var description: String {
    switch self {
    case .message(let message):
      return message
    case .other(let error):
      return error.localizedDescription
    }
  }
}
