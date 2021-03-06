//
//  DealershipHeader.swift
//  iron-forge-candidate-test-ios
//
//  Created by David on 2020/12/17.
//  Copyright © 2020 Iron Forge. All rights reserved.
//

import UIKit

class DealershipHeader: UICollectionReusableView {
  // MARK: - Instance Properties
  var dealership: Dealership! {
    didSet {
      updateViews()
    }
  }
  
  let headerImageView: UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "rectangle")
    iv.constrainHeight(constant: 214)
    return iv
  }()
  
  let guruContainerView: UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "oval")
    iv.constrainHeight(constant: 115)
    iv.layer.cornerRadius = iv.frame.size.width / 2
    iv.clipsToBounds = true
    return iv
  }()
  
  let guruImageView: UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "GuruThumbnail")
    iv.constrainHeight(constant: 85)
    iv.layer.cornerRadius = iv.frame.size.width / 2
    iv.clipsToBounds = true
    return iv
  }()
      
  let nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.init(name: "Inter-Bold", size: 24)
    label.textAlignment = .center
    label.numberOfLines = 1
    label.textColor = .black
    label.constrainHeight(constant: 30)
    return label
  }()
  
  let addressLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.init(name: "Inter-Regular", size: 16)
    label.textAlignment = .center
    label.numberOfLines = 2
    label.textColor = .black
    return label
  }()
  
  let vehicleTypeView = VehicleTypeView()
  
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
    addSubview(headerImageView)
    headerImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
    
    addSubview(guruContainerView)
    guruContainerView.centerXInSuperview()
    guruContainerView.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 160, left: 0, bottom: 0, right: 0))
    
    addSubview(guruImageView)
    guruImageView.centerXInSuperview()
    guruImageView.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 173, left: 0, bottom: 0, right: 0))
    
    addSubview(nameLabel)
    nameLabel.centerXInSuperview()
    nameLabel.anchor(top: guruImageView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    
    addSubview(addressLabel)
    addressLabel.anchor(top: nameLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 1, left: 20, bottom: 0, right: 20))
    
    addSubview(vehicleTypeView)
    vehicleTypeView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
    vehicleTypeView.constrainHeight(constant: 31)
  }
      
  fileprivate func updateViews() {
    nameLabel.text = dealership.name    
    addressLabel.text = dealership.address
    
    var vehicleTypeDict = [VehicleTypeOptions: Bool]()
    
    for i in dealership.vehicles {
      for j in VehicleTypeOptions.allCases {        
        if j.description.uppercased() == i.type.uppercased() {
          vehicleTypeDict[j] = true
        }
      }
    }
    vehicleTypeView.vehicleTypeDict = vehicleTypeDict    
  }
}
