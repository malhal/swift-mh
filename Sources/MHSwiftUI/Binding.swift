//
//  File.swift
//  swift-mh
//
//  Created by Malcolm Hall on 08/06/2026.
//

import SwiftUI

public protocol DefaultInitializable: Equatable {
    static var formDefault: Self { get }
}

extension String: DefaultInitializable { public static var formDefault: String { "" } }
extension Date: DefaultInitializable { public static var formDefault: Date { .distantPast } }

extension Binding {
    /// Allows a Binding to an Optional value to fall back to a default value if nil.
    public static func ?? <T: Equatable>(lhs: Binding<T?>, rhs: T) -> Binding<T> where Value == T? {
        Binding<T>(
            get: { lhs.wrappedValue ?? rhs },
            set: {
                lhs.wrappedValue = lhs.wrappedValue == nil && $0 == rhs ? nil : $0
            }
        )
    }
    
    public init<T: DefaultInitializable>(_ source: Binding<T?>) where Value == T {
        self.init(
            get: { source.wrappedValue ?? T.formDefault },
            set: { newValue in
                // The Shield: If model is nil and field flushes the default value on exit, ignore it.
                source.wrappedValue = (source.wrappedValue == nil && newValue == T.formDefault) ? nil : newValue
            }
        )
    }
}


