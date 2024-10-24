//
//  Font+SkodaFonts.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 23.10.2024.
//

import SwiftUI


extension Font {
    static func regular(size: CGFloat) -> Font {
        .custom("SKODANext-Regular", size: size)
    }
    
    static func bold(size: CGFloat) -> Font {
        .custom("SKODANext-Bold", size: size)
    }
    
    static func blackExpanded(size: CGFloat) -> Font {
        .custom("SKODANext-BlackExpanded", size: size)
    }
}
