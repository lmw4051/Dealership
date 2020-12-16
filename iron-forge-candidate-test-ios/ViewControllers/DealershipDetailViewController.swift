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
      print("dealership", dealership)
      collectionView.reloadData()
    }
  }
  
  var vehicles: [Vehicle] = []
  fileprivate let cellId = "CellId"
  
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
    collectionView.backgroundColor = .white
    collectionView.register(DealershipDetailCell.self, forCellWithReuseIdentifier: cellId)
    
    vehicles = dealership?.vehicles as! [Vehicle]
    print("")
    print(vehicles.count)
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
}

// MARK: - UICollectionViewDelegateFlowLayout Methods
extension DealershipDetailViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width - 22 * 2, height: DealershipDetailViewController.cellSize)
  }
}
