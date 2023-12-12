//
//  File.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 11/12/23.
//

import Foundation
import UIKit


struct SettingsCellViewModel: Identifiable{
    
    let id = UUID()
    
    public let type: SettingsOption
    public let onTapHandler: (SettingsOption) -> Void
    
    
    
    init(type: SettingsOption, onTapHandler: @escaping (SettingsOption) -> Void) {
        self.type = type
        self.onTapHandler = onTapHandler
    }
    
    public var image: UIImage? {
        return type.iconImage
    }
    
    public var title: String {
        return type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
    
}
