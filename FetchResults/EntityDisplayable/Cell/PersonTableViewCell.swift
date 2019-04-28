//
//  PersonTableViewCell.swift
//  FetchResults
//
//  Created by Игорь Майсюк on 4/28/19.
//  Copyright © 2019 Игорь Майсюк. All rights reserved.
//

import UIKit

protocol EntityDisplayableCell: Reusable, UITableViewCell {
  associatedtype Model: EntityDisplayableCellViewModel
  func configure(with model: Model)
}

class UserTableViewCell: UITableViewCell, EntityDisplayableCell {
  
  func configure(with model: UserDisplayableCellViewModel) {
    textLabel?.text = model.name
  }
    
}
