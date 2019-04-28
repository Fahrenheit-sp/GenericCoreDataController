//
//  EntityDisplayableCellViewModel.swift
//  FetchResults
//
//  Created by Игорь Майсюк on 4/28/19.
//  Copyright © 2019 Игорь Майсюк. All rights reserved.
//

import Foundation
import CoreData

protocol EntityDisplayableCellViewModel {
  init(with entity: Entity)
  associatedtype Entity: NSManagedObject
}

struct UserDisplayableCellViewModel: EntityDisplayableCellViewModel {
  
  private let entity: User
  
  init(with entity: User) {
    self.entity = entity
  }
  
  var name: String {
    return (entity.name ?? "") + " " + (entity.lastName ?? "")
  }
  
}
