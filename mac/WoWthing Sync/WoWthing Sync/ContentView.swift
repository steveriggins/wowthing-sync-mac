//
//  ContentView.swift
//  WoWthing Sync
//
//  Created by Steven W. Riggins on 7/17/22.
//

import SwiftUI

struct ContentView: View {
	@State var filename: String = ""
	var placeholder: String = String(localized: "PATH_TO_RETAIL")
	
	var body: some View {
		VStack(alignment: .leading) {
			Text("WoWthing Sync")
				.font(.system(size: 24))
			HStack {
				Text("Folder:")
				HStack {
					TextField(placeholder, text: $filename)
						.autocorrectionDisabled(true)
					Button(action: { }) {
						Image(systemName: "folder.fill")
							.foregroundColor(.blue)
					}
				}
				.padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
			}
		}
		.padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
		Spacer()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
