//
//  Interface.swift
//  Interface
//
//  Created by Gwen on 2025-10-11.
//

import Combine
import SwiftUI

public final class LogoutManager: ObservableObject {
  private let completion: @Sendable () async throws -> Void

  public init(completion: @escaping @Sendable () async throws -> Void) {
    self.completion = completion
  }

  public func logout() {
    Task { try? await completion() }
  }
}
