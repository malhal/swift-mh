//
//  MainMenu.swift
//  swift-mh-swiftui
//
//  Created by Malcolm Hall on 11/02/2026.
//
import Foundation
import SwiftUI
import MHFoundation

public extension Text {
    enum MainMenu {
        private static let bundle = Bundle.swiftUI
        private static let table = "MainMenu"

        /// Helper to fetch the App Name from your project's Info.plist
        private static var appName: String {
            Bundle.main.displayName
            ?? Bundle.main.name
            ?? "App"
        }

        public static var about: Text {
            about(appName)
        }
        
        /// Usage: Text.MainMenu.about() -> "About ActorStream"
        /// Usage: Text.MainMenu.about("Custom Name") -> "About Custom Name"
        public static func about(_ name: String) -> Text {
            // Using interpolation here ensures SwiftUI looks for the "About %@" key
            Text("About \(name)", tableName: table, bundle: bundle)
        }
        
        /// Simple static property for keys without arguments
        public static var edit: Text {
            Text("Edit", tableName: table, bundle: bundle)
        }
    }
}
