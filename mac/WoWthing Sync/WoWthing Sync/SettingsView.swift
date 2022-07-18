//
//  SettingsView.swift
//  WoWthing Sync
//
//  Created by Steven W. Riggins on 7/17/22.
//

import SwiftUI

struct SettingsView: View {
	@EnvironmentObject var settings: SettingsViewModel
	
	var body: some View {
		VStack(alignment: .leading) {
			Text("WoWthing Sync")
				.font(.system(size: 24))
			FolderSelectionView()
				.padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
		}
		.padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
		Spacer()
	}
}

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}
