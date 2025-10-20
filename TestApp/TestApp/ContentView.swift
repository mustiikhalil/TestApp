//
//  ContentView.swift
//  TestApp
//
//  Created by Gwen on 2025-10-11.
//

import Core
import Interface
import SwiftUI

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
