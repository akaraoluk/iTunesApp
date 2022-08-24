//
//  UIAlertControllerExtension.swift
//  iTunesApp
//
//  Created by Abdurrahman Karaoluk on 7.08.2022.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true)
    }
}
