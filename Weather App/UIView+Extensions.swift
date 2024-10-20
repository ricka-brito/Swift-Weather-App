//
//  UIView+Extensions.swift
//  Weather App
//
//  Created by Henrique Brito on 20/10/24.
//

import Foundation
import UIKit

extension UIView {
    func setConstraintsToParents(_ parent: UIView) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: parent.topAnchor),
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor)
        ])
    }
}

