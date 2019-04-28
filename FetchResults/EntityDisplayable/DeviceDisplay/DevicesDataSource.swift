//
//  DevicesDataSource.swift
//  FetchResults
//
//  Created by Игорь Майсюк on 4/28/19.
//  Copyright © 2019 Игорь Майсюк. All rights reserved.
//

import CoreData

final class DeviceDisplayableControllerViewModel: NSObject, FetchResultsDataSource {
  
  var frc: NSFetchedResultsController<Device>
  var delegate: FetchResultsDataSourceDelegate?
  
  typealias Model = DeviceCellViewModel
  typealias Cell = DeviceTableViewCell
  
  init(with context: NSManagedObjectContext, for user: User) {
    let request: NSFetchRequest<Model.Entity> = Model.Entity.fetchRequest()
    request.predicate = NSPredicate(format: "owner = %@", user)
    request.sortDescriptors = [NSSortDescriptor(key: "brand", ascending: true)]
    self.frc = NSFetchedResultsController(fetchRequest: request,
                                          managedObjectContext: context,
                                          sectionNameKeyPath: nil,
                                          cacheName: nil)
    super.init()
    
    try? frc.performFetch()
  }
  
}
