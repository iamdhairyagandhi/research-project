//
//  ContentView.swift
//  openTok
//
//  Created by Dhairya Gandhi on 26/04/23.
//

import SwiftUI
import Firebase
import FirebaseDatabase

struct ContentView: View {
    
    func upload() {
        let root = Database.database().reference()
        root.child("urls").childByAutoId().setValue(["name": "Neo romps happily in the snow", "url": "https://sedna.cs.umd.edu/436clips/vids/neo.mp4"])
    }
    
    var body: some View {
        Button(action: upload) {"Upload"}
    }
}
