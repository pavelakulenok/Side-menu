//
//  UIViewController+UIAlertVC.swift
//  Side menu
//
//  Created by Pavel Akulenak on 25.04.21.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlertWithOneButton(title: String, message: String, actionTitle: String, actionStyle: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: actionStyle, handler: handler)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    func showAlertWithTwoButtons(title: String, message: String, firstActionTitle: String, firstActionStyle: UIAlertAction.Style, firstHandler: ((UIAlertAction) -> Void)?, secondActionTitle: String, secondActionStyle: UIAlertAction.Style, secondHandler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let firstAction = UIAlertAction(title: firstActionTitle, style: firstActionStyle, handler: firstHandler)
        let secondAction = UIAlertAction(title: secondActionTitle, style: secondActionStyle, handler: secondHandler)
        alert.addAction(firstAction)
        alert.addAction(secondAction)
        present(alert, animated: true, completion: nil)
    }
}
