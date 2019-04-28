//
//  EntityDisplayableTableViewController.swift
//  FetchResults
//
//  Created by Игорь Майсюк on 4/28/19.
//  Copyright © 2019 Игорь Майсюк. All rights reserved.
//

import UIKit
import CoreData

final class EntityDisplayableTableViewController<DataSource: FetchResultsDataSource>: UITableViewController {
  
  private var dataSource: DataSource
  var onItemSelected: ((DataSource.Model.Entity) -> Void)?
  
  required init(with dataSource: DataSource) {
    self.dataSource = dataSource
    super.init(nibName: nil, bundle: nil)
    self.dataSource.delegate = self
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(DataSource.Cell.nib, forCellReuseIdentifier: DataSource.Cell.reuseIdentifier)
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return dataSource.numberOfSections()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.numberOfRows(in: section)
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: DataSource.Cell.reuseIdentifier, for: indexPath)
    guard let entityCell = cell as? DataSource.Cell else {return cell}
    entityCell.configure(with: dataSource.cellModel(at: indexPath))
    return entityCell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = dataSource.object(at: indexPath)
    onItemSelected?(item)
  }
  
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    return .delete
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    guard editingStyle == .delete else {return}
    dataSource.deleteObject(at: indexPath)
  }
  
}

extension EntityDisplayableTableViewController: FetchResultsDataSourceDelegate {
  func dataSourceWillChangeContent() {
    tableView.beginUpdates()
  }
  
  func dataSourceDidChangeContent() {
    tableView.endUpdates()
  }
  
  func dataSourceDidChangeObject(at sourceIndexPath: IndexPath?, to newIndexPath: IndexPath?, with style: NSFetchedResultsChangeType) {
    switch style {
    case .delete:
      guard let path = sourceIndexPath else {return}
      tableView.deleteRows(at: [path], with: .fade)
    default: return
    }
  }
  
}
