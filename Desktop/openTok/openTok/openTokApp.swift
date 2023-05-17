//
//  openTokApp.swift
//  openTok
//
//  Created by Dhairya Gandhi on 26/04/23.
//
import SwiftUI
import Firebase

@main
struct OpenTokApp: App {

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

