//
//  ContentView.swift
//  WeSplit
//
//  Created by Samuel F. Ademola on 12/15/19.
//  Copyright © 2019 Nomizo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    
    let students = ["", "Samuel", "Abraham", "David"]
    @State private var studentSelected = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                }
                Section {
                    Picker("Select your student", selection: $studentSelected) {
                        ForEach(0 ..< students.count) {
                            Text(self.students[$0])
                        }
                        
                    }
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
