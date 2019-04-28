//
//  DeviceTableViewCell.swift
//  FetchResults
//
//  Created by Игорь Майсюк on 4/28/19.
//  Copyright © 2019 Игорь Майсюк. All rights reserved.
//

import UIKit

class DeviceCellViewModel: EntityDisplayableCellViewModel {
  
  private let entity: Device
  required init(with entity: Device) {
    self.entity = entity
  }
  
  var device: String {
    return entity.brand! + " " + entity.model!
  }
  
}

class DeviceTableViewCell: UITableViewCell, EntityDisplayableCell {
  
  func configure(with model: DeviceCellViewModel) {
    textLabel?.text = model.device
  }

}
