//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Jee Zhou on 9/3/21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
