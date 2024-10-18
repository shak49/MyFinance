//
//  Tab.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/27/24.
//

import SwiftUI

enum Tab {
    case home
    case wallet
    case messaging
    
    var screen: any View {
        switch self {
        case .home:
            HomeView()
        case .wallet:
            NotImplementedView()
        case .messaging:
            NotImplementedView()
        }
    }
}
