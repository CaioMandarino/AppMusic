//
//  SintonizeApp.swift
//  Sintonize
//
//  Created by Júlia Clovandi Vasconcelos  on 27/06/25.
//

import SwiftUI

@main
struct SintonizeApp: App {
    @StateObject private var dataController = DataController()
    
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .tint(.newOrange)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
