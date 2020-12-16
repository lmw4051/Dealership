//
//  Dealership.swift
//  iron-forge-candidate-test-ios
//
//  Created by David on 2020/12/16.
//  Copyright © 2020 Iron Forge. All rights reserved.
//

import Foundation

struct Dealership {
  var id: String
  var name: String
  var address: String
  var logoUrl: String
  var vehicles: [Vehicle]
}

struct Vehicle {
  var name: String
  var address: String
  var imageUrl: String
  var priceCentsPerDay: Int
//  var type: VehicleType
}

//struct VehicleType {
//  var id: String
//  var name: String
//  var displayName: String
//}
