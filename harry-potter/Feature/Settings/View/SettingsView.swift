//
//  SettingsView.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 05/05/25.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var userSettings: UserSettings

    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Select Your House")) {
                        Picker(selection: $userSettings.preferredHouseRaw) {
                            ForEach(House.allCases, id: \.self) { house in
                                Text(house.rawValue).tag(house.rawValue)
                                    .foregroundStyle(house.color)
                            }
                        } label: {
                            EmptyView()
                        }
                        .pickerStyle(.inline)
                    }
                }
                .padding([.top])
            }
            .navigationTitle("Settings")
            .background(userSettings.preferredHouse.backgroundColor)
        }
    }
}
