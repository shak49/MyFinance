//
//  MyFinanceApp.swift
//  MyFinance
//
//  Created by Shak Feizi on 8/31/24.
//

import SwiftUI

@main
struct MyFinanceApp: App {
    // MARK: - Properties
    @Environment(\.scenePhase) var scenePhase
    
    // MARK: - Lifecycles
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            RouterView {
                ZStack {
                    Color.theme
                        .ignoresSafeArea()
                    InitialView()
                }
            }
        }
        .onChange(of: self.scenePhase) { _, phase in
            monitorApplicationLifecycleStates(phase: phase)
        }
    }
}

extension MyFinanceApp {
    // MARK: - Functions
    private func monitorApplicationLifecycleStates(phase: ScenePhase) {
        switch phase {
        case .active:
            print(">> ACTIVE <<")
        case .inactive:
            print(">> INACTIVE <<")
        case .background:
            print(">> BACKGROUND <<")
        @unknown default:
            print(">> UNKNOWN STATES <<")
        }
    }
}
