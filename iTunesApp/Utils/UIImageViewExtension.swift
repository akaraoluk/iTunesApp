//
//  UIImageViewExtension.swift
//  iTunesApp
//
//  Created by Abdurrahman Karaoluk on 7.08.2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(_ imageUrl: String, placeholder: String) {
        self.kf.setImage(with: URL(string: imageUrl), placeholder: UIImage(named: placeholder))
    }
}
