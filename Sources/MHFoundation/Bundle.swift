//
//  Bundle.swift
//  swift-mh
//
//  Created by Malcolm Hall on 11/02/2026.
//

import Foundation

public extension Bundle {
    static let swiftUI = Bundle(identifier: "com.apple.SwiftUI")!
    
    var name: String? {
        object(forInfoDictionaryKey: "CFBundleName") as? String
    }
    
    var displayName: String? {
        object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
}
