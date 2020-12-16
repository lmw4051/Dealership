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
      configureViews()
    }
  }
  
  // MARK: - View Properties
  let vehicleImageView: UIImageView = {
    let iv = UIImageView()
    iv.heightAnchor.constraint(equalToConstant: 179).isActive = true
    return iv
  }()
  
  let priceView: UIView = {
    let v = UIView()
    v.widthAnchor.constraint(equalToConstant: 62).isActive = true
    v.heightAnchor.constraint(equalToConstant: 62).isActive = true
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
    label.widthAnchor.constraint(equalToConstant: 40).isActive = true
    label.heightAnchor.constraint(equalToConstant: 27).isActive = true
    return label
  }()
  
  let dayLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.init(name: "Inter-Regular", size: 12)
    label.textAlignment = .center
    label.numberOfLines = 1
    label.text = "/day"
    label.textColor = .white
    label.widthAnchor.constraint(equalToConstant: 25).isActive = true
    label.heightAnchor.constraint(equalToConstant: 22).isActive = true
    return label
  }()
  
  let vehicleTypeLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.init(name: "Inter-Medium", size: 10)
    label.numberOfLines = 1
    label.text = "RV"
    label.textColor = .rgb(red: 243, green: 38, blue: 71)
    label.widthAnchor.constraint(equalToConstant: 57).isActive = true
    label.heightAnchor.constraint(equalToConstant: 12).isActive = true
    
    // Letter Spacing
//    let attributedString = label.attributedText as! NSMutableAttributedString
//    attributedString.addAttribute(NSAttributedString.Key.kern, value: 1.67, range: NSMakeRange(0, attributedString.length))
//    label.attributedText = attributedString
    
    return label
  }()
  
  let vehicleNameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.init(name: "Inter-Bold", size: 18)
    label.numberOfLines = 2
    label.textColor = .black
    label.widthAnchor.constraint(equalToConstant: 263).isActive = true
    label.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
    button.widthAnchor.constraint(equalToConstant: 18).isActive = true
    button.heightAnchor.constraint(equalToConstant: 12).isActive = true
    return button
  }()
  
  // MARK: - View Life Cycles
  override init(frame: CGRect) {
    super.init(frame: frame)
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
    
//    dayLabel.anchor(top: priceView.topAnchor, leading: priceView.leadingAnchor, bottom: priceView.bottomAnchor, trailing: trailingAnchor, padding: .init(top: 31, left: 19, bottom: 9, right: 18))
    
    addSubview(vehicleTypeLabel)
    vehicleTypeLabel.anchor(top: vehicleImageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 18, left: 18, bottom: 0, right: 0))
    
    addSubview(vehicleNameLabel)
    vehicleNameLabel.anchor(top: vehicleTypeLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 7, left: 18, bottom: 0, right: 0))
    
    addSubview(vehicleAddressLabel)
    vehicleAddressLabel.anchor(top: vehicleNameLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 5, left: 18, bottom: 16, right: 91))
    
    addSubview(nextPageButton)
    nextPageButton.anchor(top: nil, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 21, right: 24))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Helper Methods
  fileprivate func configureViews() {
    vehicleImageView.kf.setImage(with: URL(string: vehicle.imageUrl))
    priceLabel.text = "$\(vehicle.priceCentsPerDay)"
    vehicleNameLabel.text = vehicle.name
    vehicleAddressLabel.text = vehicle.address
  }
}
