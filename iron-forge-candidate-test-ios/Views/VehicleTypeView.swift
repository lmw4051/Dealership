//
//  VehicleTypeView.swift
//  iron-forge-candidate-test-ios
//
//  Created by David on 2020/12/17.
//  Copyright © 2020 Iron Forge. All rights reserved.
//

import UIKit

class VehicleTypeView: UIView {
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = .red
//    cv.delegate = self
//    cv.dataSource = self
    return cv
  }()
  
  // MARK: - View Life Cycles
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(collectionView)
    collectionView.fillSuperview()
//    collectionView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension VehicleTypeView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: frame.width / 3, height: frame.height)
  }
}
