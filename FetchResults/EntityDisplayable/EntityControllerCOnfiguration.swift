//
//  EntityControllerCOnfiguration.swift
//  FetchResults
//
//  Created by Игорь Майсюк on 4/28/19.
//  Copyright © 2019 Игорь Майсюк. All rights reserved.
//

import UIKit

class EntityControllerConfiguration {
  
  func editingStyleForRow(at indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    return .none
  }
  
  func isEditingAllowed(at indexPath: IndexPath) -> Bool {
    return false
  }
}

final class EntityControllerDeletableConfiguration: EntityControllerConfiguration {
  
  override func editingStyleForRow(at indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    return .delete
  }
  
  override func isEditingAllowed(at indexPath: IndexPath) -> Bool {
    return true
  }
}
