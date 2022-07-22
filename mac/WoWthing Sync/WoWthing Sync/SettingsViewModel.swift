//
//  SettingsViewModel.swift
//  WoWthing Sync
//
//  Created by Steven W. Riggins on 7/17/22.
//

import Foundation

class SettingsViewModel: ObservableObject {
	private let folderPathKey = "FOLDER_PATH"
	@Published var folderPath: String = ""
	
	init() {
		load()
	}
	
	func useFolder(_ url: URL) {
		let selectedFolder = url.path(percentEncoded: false)
		guard selectedFolder.hasSuffix("_retail_/") else { return }
		self.folderPath = selectedFolder
		save()
	}
	
	private func save() {
		UserDefaults.standard.setValue(folderPath, forKey: folderPathKey)
	}
	
	private func load() {
		if let folderPath = UserDefaults.standard.string(forKey: folderPathKey) {
			self.folderPath = folderPath
		}
	}
}
