//
//  PersonTableViewCell.swift
//  FetchResults
//
//  Created by Игорь Майсюк on 4/28/19.
//  Copyright © 2019 Игорь Майсюк. All rights reserved.
//

import UIKit

struct UserDisplayableCellViewModel: EntityDisplayableCellViewModel {
  
  private let user: User
  
  init(with entity: User) {
    self.user = entity
  }
  
  var name: String {
    return user.name! + " " + user.lastName!
  }
  
}

class UserTableViewCell: UITableViewCell, EntityDisplayableCell {
  
  func configure(with model: UserDisplayableCellViewModel) {
    textLabel?.text = model.name
  }
    
}
