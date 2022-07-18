//
//  SettingsViewModel.swift
//  WoWthing Sync
//
//  Created by Steven W. Riggins on 7/17/22.
//

import Foundation

class SettingsViewModel: ObservableObject {
	@Published var folderPath: String = ""
	
	func useFolder(_ url: URL) {
		let selectedFolder = url.path(percentEncoded: false)
		guard selectedFolder.hasSuffix("_retail_/") else { return }
		self.folderPath = selectedFolder
	}
}
