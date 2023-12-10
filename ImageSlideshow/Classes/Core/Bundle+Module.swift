//
//  File.swift
//  
//
//  Created by Jordan Wood on 12/10/23.
//


import Foundation

#if !SWIFT_PACKAGE
extension Bundle {
    static var module: Bundle = {
        return Bundle(for: ImageSlideshow.self)
    }()
}
#endif
