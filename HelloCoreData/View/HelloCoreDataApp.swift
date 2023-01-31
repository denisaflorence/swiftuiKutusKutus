//
//  HelloCoreDataApp.swift
//  HelloCoreData
//
//  Created by Denisa on 16/01/23.
//

import SwiftUI

@main
struct HelloCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
