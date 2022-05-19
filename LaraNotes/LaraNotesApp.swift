//
//  LaraNotesApp.swift
//  LaraNotes
//
//  Created by Christian Paulo on 09/05/22.
//

import SwiftUI

@main
struct LaraNotesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(report: .api)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
