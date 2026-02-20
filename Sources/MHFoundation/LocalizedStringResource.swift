//
//  swiftUI.swift
//  swift-mh
//
//  Created by Malcolm Hall on 19/02/2026.
//
import Foundation

public extension LocalizedStringResource.BundleDescription {
    
    func localizedStringResource(_ keyAndValue: String.LocalizationValue, table: String) -> LocalizedStringResource {
        LocalizedStringResource(keyAndValue, table: table, bundle: self)
    }
    
    struct SwiftUI {
        static var bundle: LocalizedStringResource.BundleDescription {
            .atURL(Bundle.swiftUI.bundleURL)
        }
//        public var infoPlist: InfoPlist {
//            .init(bundle: Self.bundle)
//        }
        public var mainMenu: MainMenu { .init() }
        
        public struct MainMenu {
            
            static let table = "MainMenu"
            
            // Static key
            public func edit() -> LocalizedStringResource { self("Edit") }
            
            // Dynamic call
            public func callAsFunction(_ value: String.LocalizationValue) -> LocalizedStringResource {
                bundle.localizedStringResource(value, table: Self.table)
            }
            
            public func about(name: LocalizedStringResource? = nil) -> LocalizedStringResource {
                // 1. Resolve the name with a proper fallback chain.
                // We use the parameter if provided, otherwise check the Main App InfoPlist.
                let resolvedName: LocalizedStringResource
                
                if let name {
                    resolvedName = name
                } else {
                    // This block only executes if name is nil
                    let infoPlist = InfoPlist(bundle: .main)
                    resolvedName = infoPlist.bundleDisplayName
                    ?? infoPlist.bundleName
                    ?? self("App")
                }
                
                // 2. Interpolate the concrete resource.
                // This triggers the correct 'About %@' lookup.
                return self("About \(resolvedName)")
            }
        }
    }
    
    public struct InfoPlist {
        let bundle: LocalizedStringResource.BundleDescription
        static let table = "InfoPlist"
        
        public var bundleName: LocalizedStringResource {
            self(kCFBundleNameKey)
        }
        
        public var bundleDisplayName: LocalizedStringResource {
            self("CFBundleDisplayName")
        }
        
        public func callAsFunction(_ keyAndValue: CFString) -> LocalizedStringResource {
            self(String.LocalizationValue(keyAndValue as String))
        }
        
        public func callAsFunction(_ keyAndValue: String.LocalizationValue) -> LocalizedStringResource {
            bundle.localizedStringResource(keyAndValue, table: Self.table)
        }
    }
}

public extension LocalizedStringResource {
    // This is the "Magic Link"
    // It allows Text(.swiftUI.mainMenu.edit) to work because the compiler
    // sees 'swiftUI' as a static property returning a specific type.
    static var swiftUI: BundleDescription.SwiftUI {
        .init()
    }
    
    public static func infoPlist(for bundle: LocalizedStringResource.BundleDescription = .main) -> BundleDescription.InfoPlist {
        .init(bundle: bundle)
    }
}
