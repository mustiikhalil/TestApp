//
//  ContentView.swift
//  TestApp2
//
//  Created by Gwen on 2025-10-20.
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

struct ContentView: View {
  @StateObject private var logoutManager: LogoutManager

  init() {
    let logoutManager = LogoutManager {
      try await Task.sleep(for: .seconds(10))
      print("Logout")
    }
    
    _logoutManager = .init(wrappedValue: logoutManager)
  }

  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
    }
    .padding()
    .environmentObject(logoutManager)
  }

}
