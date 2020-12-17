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
      configureViews()
    }
  }
  
  let headerImageView: UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "rectangle")
    iv.heightAnchor.constraint(equalToConstant: 214).isActive = true
    return iv
  }()
  
  let guruContainerView: UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "oval")
    iv.heightAnchor.constraint(equalToConstant: 115).isActive = true
    iv.layer.cornerRadius = iv.frame.size.width / 2
    iv.clipsToBounds = true
    return iv
  }()
  
  let guruImageView: UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "GuruThumbnail")
    iv.heightAnchor.constraint(equalToConstant: 85).isActive = true
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
    label.heightAnchor.constraint(equalToConstant: 30).isActive = true
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
    vehicleTypeView.anchor(top: addressLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 19, left: 0, bottom: 0, right: 0))
    vehicleTypeView.constrainHeight(constant: 31)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Helper Methods
  func configureViews() {
    nameLabel.text = dealership.name
    addressLabel.text = dealership.address
  }
}
