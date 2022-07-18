//
//  SettingsView.swift
//  WoWthing Sync
//
//  Created by Steven W. Riggins on 7/17/22.
//

import SwiftUI

struct SettingsView: View {
	@EnvironmentObject var settings: SettingsViewModel
	@State var folderPickerPresented = false
	@State var selectedPath: String = ""
	
	var placeholder: String = String(localized: "PATH_TO_RETAIL")
	
	var body: some View {
		VStack(alignment: .leading) {
			Text("WoWthing Sync")
				.font(.system(size: 24))
			HStack {
				Text("Folder:")
				HStack {
					TextField(placeholder, text: $settings.folderPath)
						.autocorrectionDisabled(true)
					Button(action: {
						folderPickerPresented = true
					}) {
						Image(systemName: "folder.fill")
							.foregroundColor(.blue)
					}
				}
				.padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
			}
		}
		.padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
		.fileImporter(
			isPresented: $folderPickerPresented,
			allowedContentTypes: [.folder],
			allowsMultipleSelection: false
		) { result in
			do {
				guard let url: URL = try result.get().first else { return }
				settings.useFolder(url)
			} catch {
				// Handle failure.
			}
		}
		Spacer()
	}
}

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}
