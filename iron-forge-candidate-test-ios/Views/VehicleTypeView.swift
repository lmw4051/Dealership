//
//  VehicleTypeView.swift
//  iron-forge-candidate-test-ios
//
//  Created by David on 2020/12/17.
//  Copyright © 2020 Iron Forge. All rights reserved.
//

import UIKit

enum VehicleTypeOptions: Int, CaseIterable {
  case rv
  case snowmobile
  case jetski
  case kayaks
  case boat
  case atv
  
  var description: String {
    switch self {
    case .rv: return "RV"
    case .snowmobile: return "SNOWMOBILE"
    case .jetski: return "JET SKI"
    case .kayaks: return "KAYAKS"
    case .boat: return "BOAT"
    case .atv: return "ATV"
    }
  }
}

class VehicleTypeView: UIView {
  
  lazy var collectionView: UICollectionView = {
    let layout = LeftAlignedCollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
//    layout.itemSize = UICollectionViewFlowLayout.automaticSize
    layout.estimatedItemSize = .init(width: 40, height: 43)
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = .white
//    cv.delegate = self
    cv.dataSource = self
    return cv
  }()
  
  fileprivate let cellId = "cellId"
  
  // MARK: - View Life Cycles
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(collectionView)
    collectionView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    collectionView.register(VehicleTypeCell.self, forCellWithReuseIdentifier: cellId)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - UICollectionViewDataSource
extension VehicleTypeView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return VehicleTypeOptions.allCases.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! VehicleTypeCell
    cell.option = VehicleTypeOptions(rawValue: indexPath.row)
    return cell
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension VehicleTypeView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: frame.width, height: frame.height)
  }    
}
