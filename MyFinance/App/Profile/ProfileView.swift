//
//  ProfileView.swift
//  MyFinance
//
//  Created by Shak Feizi on 9/27/24.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - Properties
    @StateObject var model = ProfileVM()
    
    // MARK: - Body
    var body: some View {
        ContainerView {
            Text("Welcome \(self.model.fullname)!")
                .foregroundStyle(.textAccentW)
        }
    }
}

#Preview {
    ProfileView()
}
