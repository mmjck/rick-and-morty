//
//  Extensions.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 02/12/23.
//

import Foundation


import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}



extension UIDevice {
    static let isiPhone = UIDevice.current.userInterfaceIdiom == .phone
}
