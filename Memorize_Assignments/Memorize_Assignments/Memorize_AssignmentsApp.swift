//
//  Memorize_AssignmentsApp.swift
//  Memorize_Assignments
//
//  Created by Oriol Sanchez Miro on 10/10/22.
//

import SwiftUI

@main
struct Memorize_AssignmentsApp: App {
    let game = MemorizeViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
