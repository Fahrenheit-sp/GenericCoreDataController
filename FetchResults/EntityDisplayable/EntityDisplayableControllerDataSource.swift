//
//  EntityDisplayableControllerDataSource.swift
//  FetchResults
//
//  Created by Игорь Майсюк on 4/28/19.
//  Copyright © 2019 Игорь Майсюк. All rights reserved.
//

import Foundation
import CoreData

protocol FetchResultsDataSourceDelegate: class {
  func dataSourceWillChangeContent()
  func dataSourceDidChangeContent()
  func dataSourceDidChangeObject(at sourceIndexPath: IndexPath?,
                                 to newIndexPath: IndexPath?,
                                 with style: NSFetchedResultsChangeType)
}

protocol EntityDisplayableControllerDataSource {
  associatedtype Model: EntityDisplayableCellViewModel
  associatedtype Cell: EntityDisplayableCell
}

protocol FetchResultsDataSource: EntityDisplayableControllerDataSource {
  var frc: NSFetchedResultsController<Model.Entity> {get}
  var delegate: FetchResultsDataSourceDelegate? {get set}
  var configuration: EntityControllerConfiguration {get}
  
  func cellModel(at indexPath: IndexPath) -> Cell.Model
  func numberOfSections() -> Int
  func numberOfRows(in section: Int) -> Int
  func object(at indexPath: IndexPath) -> Model.Entity
  func deleteObject(at indexPath: IndexPath)
}

extension FetchResultsDataSource {
  
  func cellModel(at indexPath: IndexPath) -> Model {
    let entity = object(at: indexPath)
    return Model.init(with: entity)
  }
  
  func numberOfSections() -> Int {
    return frc.sections?.count ?? 1
  }
  
  func numberOfRows(in section: Int) -> Int {
    return frc.sections?[section].numberOfObjects ?? 0
  }
  
  func object(at indexPath: IndexPath) -> Model.Entity {
    return frc.object(at: indexPath)
  }
  
  func deleteObject(at indexPath: IndexPath) {
    
  }
}
