//
//  UIView+.swift
//  TikTok
//
//  Created by IJ . on 2019/12/30.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit

extension UIView {
    static func instantiate<View: UIView>(_ type: View.Type) -> View {
        return UINib(nibName: type.name, bundle: nil).instantiate(withOwner: nil, options: nil).first as! View
    }
}
