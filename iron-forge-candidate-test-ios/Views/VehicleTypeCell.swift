//
//  VehicleTypeCell.swift
//  iron-forge-candidate-test-ios
//
//  Created by David on 2020/12/17.
//  Copyright © 2020 Iron Forge. All rights reserved.
//

import UIKit

class VehicleTypeCell: UICollectionViewCell {
  var option: VehicleTypeOptions! {
    didSet {
      configureViews()
    }
  }
  
  let vehicleTypeLabel: PaddingLabel = {
    let label = PaddingLabel(withInsets: 6, 6, 5, 5)
    label.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 14)
    label.textAlignment = .center
    label.numberOfLines = 1
    label.textColor = .rgb(red: 220, green: 71, blue: 78)
    label.constrainHeight(constant: 31)
    label.layer.cornerRadius = 6
    label.layer.borderWidth = 0.5
    label.layer.borderColor = UIColor.lightGray.cgColor    
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    
    addSubview(vehicleTypeLabel)
    vehicleTypeLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Helper Methods
  fileprivate func configureViews() {
    vehicleTypeLabel.text = option.description
    vehicleTypeLabel.addCharacterSpacing(kernValue: 2)
  }
}
