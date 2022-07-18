//
//  FolderSelectionView.swift
//  WoWthing Sync
//
//  Created by Steven W. Riggins on 7/17/22.
//

import SwiftUI

struct FolderSelectionView: View {
	@State var folderPath: String
	@State var folderPickerPresented = false
	var placeholder: String = String(localized: "PATH_TO_RETAIL")
	
	var body: some View {
		HStack {
			Text("Folder:")
			HStack {
				TextField(placeholder, text: $folderPath)
					.autocorrectionDisabled(true)
				Button(action: {
					folderPickerPresented = true
				}) {
					Image(systemName: "folder.fill")
						.foregroundColor(.blue)
				}
			}
			.fileImporter(
				isPresented: $folderPickerPresented,
				allowedContentTypes: [.folder],
				allowsMultipleSelection: false
			) { result in
				do {
					guard let url: URL = try result.get().first else { return }
					let path = url.path(percentEncoded: false)
					folderPath = path
					
				} catch {
					// Handle failure.
				}
			}
		}
	}
}

struct FolderSelectionVIew_Previews: PreviewProvider {
	static var previews: some View {
		FolderSelectionView(folderPath: "")
			.previewDisplayName("Placeholder")
		FolderSelectionView(folderPath: "/Test/Dummies/Path/")
			.previewDisplayName("Path")
	}
}
