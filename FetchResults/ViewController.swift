//
//  ViewController.swift
//  FetchResults
//
//  Created by Игорь Майсюк on 4/28/19.
//  Copyright © 2019 Игорь Майсюк. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var container: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let model = UserDisplayableControllerViewModel()
    let controller = EntityDisplayableTableViewController(with: model)
    addChild(controller)
    container.addSubview(controller.view)
    controller.didMove(toParent: self)
  }

}

