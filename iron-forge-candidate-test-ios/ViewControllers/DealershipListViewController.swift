//
//  ViewController.swift
//  template-ios-test
//
//  Created by Andrew Daniel on 5/13/20.
//  Copyright © 2020 Iron Forge. All rights reserved.
//

import UIKit

class DealershipListViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  var dealerships: [Dealership] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = self
    self.tableView.delegate = self
    
    loadData()
  }
  
  fileprivate func loadData() {
    Apollo.client.fetch(query: DealershipListQuery(), resultHandler: {
      guard let newDealerships = try? $0.get().data?.dealerships
        .map({ Dealership(
          id: $0.id,
          name: $0.name,
          address: $0.address,
          logoUrl: $0.logoUrl,
          vehicles: $0.vehicles.map({ Vehicle(
            name: $0.name,
            address: $0.address,
            imageUrl: $0.imageUrl,
            priceCentsPerDay: $0.priceCentsPerDay) })) }) else {
          return
      }

      self.dealerships = newDealerships
      print(self.dealerships)
    })
  }
}

extension DealershipListViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.dealerships.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "dealershipCell")!
    
    cell.textLabel?.text = dealerships[indexPath.row].name
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // Segue to dealership detail
  }
  
}
