//
//  BaseCell.swift
//  iron-forge-candidate-test-ios
//
//  Created by David on 2020/12/17.
//  Copyright © 2020 Iron Forge. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
  
  // MARK: - Instance Properties
  override var isHighlighted: Bool {
    didSet {
      var transform: CGAffineTransform = .identity
      
      if isHighlighted {
        transform = .init(scaleX: 0.9, y: 0.9)
      }
      
      UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
        self.transform = transform
      })
    }
  }
  
  // MARK: - View Life Cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundView = UIView()
    
    addSubview(self.backgroundView!)
    self.backgroundView?.fillSuperview()
    self.backgroundView?.backgroundColor = .white
    
    self.backgroundView?.layer.shadowOpacity = 0.25
    self.backgroundView?.layer.shadowRadius = 10
    self.backgroundView?.layer.shadowOffset = .init(width: 10, height: 10)        
    self.backgroundView?.layer.shouldRasterize = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
