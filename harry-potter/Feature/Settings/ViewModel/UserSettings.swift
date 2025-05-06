//
//  UserSettings.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 05/05/25.
//

import SwiftUI

final class UserSettings: ObservableObject {
  @AppStorage("preferredHouse")
  var preferredHouseRaw: String = House.slytherin.rawValue

  var preferredHouse: House {
    get { House(rawValue: preferredHouseRaw) ?? .none }
    set { preferredHouseRaw = newValue.rawValue }
  }
}
