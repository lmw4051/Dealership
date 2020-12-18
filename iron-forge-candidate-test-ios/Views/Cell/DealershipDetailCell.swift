//
//  DealershipDetailCell.swift
//  iron-forge-candidate-test-ios
//
//  Created by David on 2020/12/16.
//  Copyright © 2020 Iron Forge. All rights reserved.
//

import UIKit
import Kingfisher

class DealershipDetailCell: BaseCell {
  // MARK: - Instance Properties
  var vehicle: Vehicle! {
    didSet {
      updateViews()
    }
  }
  
  // MARK: - View Properties
  let vehicleImageView: UIImageView = {
    let iv = UIImageView()
    iv.constrainHeight(constant: 179)
    return iv
  }()
  
  let priceView: UIView = {
    let v = UIView()
    v.constrainWidth(constant: 62)
    v.constrainHeight(constant: 62)
    v.backgroundColor = UIColor.rgb(red: 217, green: 57, blue: 64)
    return v
  }()
  
  let priceLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.init(name: "AvenirNextCondensed-DemiBold", size: 20)
    label.textAlignment = .center
    label.adjustsFontSizeToFitWidth = true
    label.numberOfLines = 1
    label.textColor = .white
    label.constrainWidth(constant: 40)
    label.constrainHeight(constant: 27)
    return label
  }()
  
  let dayLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.init(name: "Inter-Regular", size: 12)
    label.textAlignment = .center
    label.numberOfLines = 1
    label.text = "/day"
    label.textColor = .white
    label.constrainWidth(constant: 25)
    label.constrainHeight(constant: 22)
    return label
  }()
  
  let vehicleTypeLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.init(name: "Inter-Medium", size: 10)
    label.numberOfLines = 1
    label.textColor = .rgb(red: 243, green: 38, blue: 71)
    label.constrainHeight(constant: 12)
    return label
  }()
  
  let vehicleNameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.init(name: "Inter-Bold", size: 18)
    label.numberOfLines = 2
    label.textColor = .black
    label.constrainWidth(constant: 263)
    label.constrainHeight(constant: 50)
    return label
  }()
  
  let vehicleAddressLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.init(name: "Inter-Regular", size: 12)
    label.numberOfLines = 1
    label.text = "Address Address Address"
    label.textColor = .rgb(red: 161, green: 161, blue: 161)
    return label
  }()
  
  let nextPageButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "keyboardBackspace"), for: .normal)
    button.tintColor = .black
    button.constrainWidth(constant: 18)
    button.constrainHeight(constant: 12)
    return button
  }()
  
  // MARK: - View Life Cycles
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Helper Methods
  fileprivate func setupViews() {
    backgroundColor = .white
    
    addSubview(vehicleImageView)
    vehicleImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
    
    addSubview(priceView)
    priceView.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 135, left: 0, bottom: 0, right: 22))
    
    priceView.addSubview(priceLabel)
    priceLabel.anchor(top: priceView.topAnchor, leading: priceView.leadingAnchor, bottom: nil, trailing: priceView.trailingAnchor, padding: .init(top: 9, left: 11, bottom: 0, right: 11))
    
    priceView.addSubview(dayLabel)
    dayLabel.centerXInSuperview()
    dayLabel.anchor(top: priceView.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 31, left: 0, bottom: 0, right: 0))
    
    addSubview(vehicleTypeLabel)
    vehicleTypeLabel.anchor(top: vehicleImageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 18, left: 18, bottom: 0, right: 16))
    
    addSubview(vehicleNameLabel)
    vehicleNameLabel.anchor(top: vehicleTypeLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 7, left: 18, bottom: 0, right: 0))
    
    addSubview(vehicleAddressLabel)
    vehicleAddressLabel.anchor(top: vehicleNameLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 5, left: 18, bottom: 16, right: 91))
    
    addSubview(nextPageButton)
    nextPageButton.anchor(top: nil, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 21, right: 24))
  }
    
  fileprivate func updateViews() {
    vehicleImageView.kf.setImage(with: URL(string: vehicle.imageUrl))
    priceLabel.text = "$\(vehicle.priceCentsPerDay)"
    
    vehicleTypeLabel.text = vehicle.type
    vehicleTypeLabel.addCharacterSpacing(kernValue: 1.67)
    
    vehicleNameLabel.text = vehicle.name
    vehicleAddressLabel.text = vehicle.address
  }
}
