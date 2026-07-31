//
//  SortComparator.swift
//  swift-mh
//
//  Created by Malcolm Hall on 19/03/2026.
//

import Foundation

//KeyPathComparator
extension SortComparator {
    /// Returns a copy of the comparator with the opposite sort order.
    func reversed() -> Self {
        var copy = self
        copy.order = (self.order == .forward ? .reverse : .forward)
        return copy
    }
}
