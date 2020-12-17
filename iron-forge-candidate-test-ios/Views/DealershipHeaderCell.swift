//
//  DealershipHeaderCell.swift
//  iron-forge-candidate-test-ios
//
//  Created by David on 2020/12/17.
//  Copyright © 2020 Iron Forge. All rights reserved.
//

import UIKit

class DealershipHeader: UICollectionReusableView {
  // MARK: - Instance Properties
  var vehicle: Vehicle! {
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
  
  // MARK: - View Life Cycles
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(headerImageView)
    headerImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
  }
  
  // MARK: - Helper Methods
  func configureViews() {
    
  }
}
