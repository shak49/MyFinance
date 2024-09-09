//
//  Router.swift
//  MyFinance
//
//  Created by Shak Feizi on 8/31/24.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    // MARK: - Properties
    @Published var path = NavigationPath()
    
    // MARK: - Lifecycles
    
    // MARK: - Functions
    func navigateTo(screen: Screen) {
        self.path.append(screen)
    }
    
    func navigateBack() {
        self.path.removeLast()
    }
    
    func popToRoot() {
        self.path.removeLast(path.count)
    }
}
