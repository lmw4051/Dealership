//
//  ViewController.swift
//  template-ios-test
//
//  Created by Andrew Daniel on 5/13/20.
//  Copyright © 2020 Iron Forge. All rights reserved.
//

import UIKit

class DealershipListViewController: UIViewController {
  
  // MARK: - Instance Properties
  @IBOutlet weak var tableView: UITableView!
  
  var dealerships: [Dealership] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  
  fileprivate var activityIndicatorView = UIActivityIndicatorView()
  
  // MARK: - View Life Cycles
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    loadData()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.barStyle = .default
    navigationController?.navigationBar.isHidden = false
  }
  
  // MARK: - Helper Methods
  fileprivate func configureTableView() {
    tableView.dataSource = self
    tableView.delegate = self
    
    navigationItem.title = "Dealership"
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  fileprivate func loadData() {    
    activityIndicatorView.startAnimating()
    
    Apollo.client.fetch(query: DealershipListQuery(), resultHandler: { [weak self] in
      guard let self = self else { return }
      
      self.activityIndicatorView.stopAnimating()
      
      guard let newDealerships = try? $0.get().data?.dealerships
        .map({ Dealership(
          id: $0.id,
          name: $0.name,
          address: $0.address,
          logoUrl: $0.logoUrl,
          vehicles: $0.vehicles.map({ Vehicle(
            type: $0.type.displayName,
            name: $0.name,
            address: $0.address,
            imageUrl: $0.imageUrl,
            priceCentsPerDay: $0.priceCentsPerDay) })) }) else {
          return
      }
      
      self.dealerships = newDealerships
    })
  }
}

// MARK: - UITableViewDataSource Methods
extension DealershipListViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.dealerships.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "dealershipCell")!
    
    cell.textLabel?.text = dealerships[indexPath.row].name
    
    return cell
  }
  
  // MARK: - UITableViewDelegate Methods
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.deselectRow(at: indexPath, animated: true)
    
    let detailVC = DealershipDetailViewController()
    detailVC.dealership = dealerships[indexPath.row]
    navigationController?.pushViewController(detailVC, animated: true)
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    let footerView = UIView()
    footerView.addSubview(activityIndicatorView)
    activityIndicatorView.color = .lightGray
    activityIndicatorView.fillSuperview()
    return footerView
  }
}
