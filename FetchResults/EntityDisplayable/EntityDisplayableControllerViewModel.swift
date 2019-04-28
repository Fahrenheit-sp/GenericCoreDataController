//
//  EntityDisplayableControllerViewModel.swift
//  FetchResults
//
//  Created by Игорь Майсюк on 4/28/19.
//  Copyright © 2019 Игорь Майсюк. All rights reserved.
//

import Foundation

protocol EntityDisplayableControllerDataSource {
  associatedtype Model: EntityDisplayableCellViewModel
  associatedtype Cell: EntityDisplayableCell
  func cellModel(at indexPath: IndexPath) -> Cell.Model
  func numberOfSections() -> Int
  func numberOfRows(in section: Int) -> Int
}

extension EntityDisplayableControllerDataSource {
  func numberOfSections() -> Int {
    return 1
  }
}

final class UserDisplayableControllerViewModel: EntityDisplayableControllerDataSource {
  typealias Model = UserDisplayableCellViewModel
  typealias Cell = UserTableViewCell
  
  let models: [UserDisplayableCellViewModel] = []
  
  func cellModel(at indexPath: IndexPath) -> UserDisplayableCellViewModel {
    return models[indexPath.row]
  }
  
  func numberOfRows(in section: Int) -> Int {
    return models.count
  }
}
