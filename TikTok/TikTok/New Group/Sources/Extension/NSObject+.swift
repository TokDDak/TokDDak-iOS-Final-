//
//  NSObject+.swift
//  TikTok
//
//  Created by IJ . on 2019/12/30.
//  Copyright © 2019 김준성. All rights reserved.
//

import Foundation

extension NSObject {
    var name: String {
        return NSStringFromClass(type(of: self))
    }
    
    static var name: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}
