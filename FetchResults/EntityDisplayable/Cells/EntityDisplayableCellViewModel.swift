//
//  EntityDisplayableCellViewModel.swift
//  FetchResults
//
//  Created by Игорь Майсюк on 4/28/19.
//  Copyright © 2019 Игорь Майсюк. All rights reserved.
//

import UIKit
import CoreData

protocol EntityDisplayableCellViewModel {
  init(with entity: Entity)
  associatedtype Entity: NSManagedObject
}

protocol EntityDisplayableCell: Reusable, UITableViewCell {
  associatedtype Model: EntityDisplayableCellViewModel
  func configure(with model: Model)
}
