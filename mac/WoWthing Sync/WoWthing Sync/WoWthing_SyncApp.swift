//
//  WoWthing_SyncApp.swift
//  WoWthing Sync
//
//  Created by Steven W. Riggins on 7/17/22.
//

import SwiftUI

@main
struct WoWthing_SyncApp: App {
	@StateObject var settings = SettingsViewModel()
    var body: some Scene {
        WindowGroup {
            SettingsView()
				.environmentObject(settings)
        }
    }
}
