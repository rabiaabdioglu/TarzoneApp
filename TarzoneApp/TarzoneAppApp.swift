//
//  TarzoneAppApp.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 1.05.2023.
//

import SwiftUI
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct TarzoneAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate


    var body: some Scene {
        WindowGroup {
            
            ContentView()
        }
    }
}
