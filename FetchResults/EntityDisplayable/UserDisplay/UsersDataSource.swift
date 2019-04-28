//
//  UsersDataSource.swift
//  FetchResults
//
//  Created by Игорь Майсюк on 4/28/19.
//  Copyright © 2019 Игорь Майсюк. All rights reserved.
//

import CoreData

final class UserDisplayableControllerViewModel: NSObject, FetchResultsDataSource {
  var frc: NSFetchedResultsController<User>
  let configuration: EntityControllerConfiguration
  private let context: NSManagedObjectContext
  
  typealias Model = UserDisplayableCellViewModel
  typealias Cell = UserTableViewCell
  weak var delegate: FetchResultsDataSourceDelegate?
  
  init(with context: NSManagedObjectContext, configuration: EntityControllerConfiguration = EntityControllerDeletableConfiguration()) {
    let request: NSFetchRequest<Model.Entity> = Model.Entity.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
    self.frc = NSFetchedResultsController(fetchRequest: request,
                                          managedObjectContext: context,
                                          sectionNameKeyPath: nil,
                                          cacheName: nil)
    self.context = context
    self.configuration = configuration
    super.init()
    frc.delegate = self
    try? frc.performFetch()
  }
  
  func deleteObject(at indexPath: IndexPath) {
    let item = object(at: indexPath)
    context.delete(item)
    try? context.save()
  }
  
}

extension UserDisplayableControllerViewModel: NSFetchedResultsControllerDelegate {
  func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                  didChange anObject: Any,
                  at indexPath: IndexPath?,
                  for type: NSFetchedResultsChangeType,
                  newIndexPath: IndexPath?) {
    delegate?.dataSourceDidChangeObject(at: indexPath, to: newIndexPath, with: type)
  }
  
  func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    delegate?.dataSourceWillChangeContent()
  }
  
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    delegate?.dataSourceDidChangeContent()
  }
}
