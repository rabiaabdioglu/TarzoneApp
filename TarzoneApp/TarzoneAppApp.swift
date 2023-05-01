//
//  TarzoneAppApp.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 1.05.2023.
//

import SwiftUI

@main
struct TarzoneAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
