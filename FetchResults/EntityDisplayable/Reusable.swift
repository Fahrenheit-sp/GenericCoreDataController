//
//  Reusable.swift
//  IrregularVerbs
//
//  Created by Elatesoftware on 5/14/18.
//  Copyright © 2018 Elatesoftware. All rights reserved.
//

import Foundation
import UIKit

protocol Reusable: class {
  static var nib: UINib { get }
  static var reuseIdentifier: String { get }
  static var cellClass: AnyClass { get }
}

extension Reusable {
  static var nib: UINib {
    return UINib(nibName: String(describing: Self.self), bundle: nil)
  }
  
  static var reuseIdentifier: String {
    return String(describing: Self.self) + "Identifier"
  }
  
  static var cellClass: AnyClass {
    return Self.self
  }
}
