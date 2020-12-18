//
//  DealershipDetailViewController.swift
//  iron-forge-candidate-test-ios
//
//  Created by David on 2020/12/16.
//  Copyright © 2020 Iron Forge. All rights reserved.
//

import UIKit

class DealershipDetailViewController: UICollectionViewController {
  // MARK: - Instance Properties
  var dealership: Dealership? {
    didSet {
      collectionView.reloadData()
    }
  }
  
  var vehicles: [Vehicle] = []
  fileprivate let cellId = "cellId"
  fileprivate let headerId = "headerId"
  
  static let cellSize: CGFloat = 309
  
  // MARK: - View Life Cycle
  init() {
    super.init(collectionViewLayout: UICollectionViewFlowLayout())
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollectionView()
    
    vehicles = dealership?.vehicles as! [Vehicle]
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.barStyle = .black
    navigationController?.navigationBar.isHidden = true
  }
  
  // MARK: - Helper Methods
  fileprivate func configureCollectionView() {
    collectionView.backgroundColor = .white
    collectionView.contentInsetAdjustmentBehavior = .never
    
    collectionView.register(DealershipDetailCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(DealershipHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
  }
}

extension DealershipDetailViewController {
  // MARK: - UICollectionViewDataSource Methods
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {    
    return vehicles.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DealershipDetailCell
    cell.vehicle = vehicles[indexPath.item]
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! DealershipHeader
    header.dealership = dealership
    return header
  }
}

// MARK: - UICollectionViewDelegateFlowLayout Methods
extension DealershipDetailViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width - 22 * 2, height: DealershipDetailViewController.cellSize)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return .init(width: view.frame.width, height: 358 + 31 + 29)
  }
}
