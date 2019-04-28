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
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let model = UserDisplayableControllerViewModel(with: context)
    let controller = EntityDisplayableTableViewController(with: model)
    controller.onItemSelected = { [weak controller] user in
      let devicesModel = DeviceDisplayableControllerViewModel(with: context, for: user)
      let devicesController = EntityDisplayableTableViewController(with: devicesModel)
      devicesController.onItemSelected = { [weak devicesController] _ in
        devicesController?.dismiss(animated: true, completion: nil)
      }
      controller?.present(devicesController, animated: true, completion: nil)
    }
    addChild(controller)
    container.addSubview(controller.view)
    controller.didMove(toParent: self)
  }
  

}
