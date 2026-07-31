//
//  File.swift
//  swift-mh
//
//  Created by Malcolm Hall on 24/02/2026.
//

import CoreData
#if canImport(SwiftUI)
import SwiftUI

public struct SectionedFetchRequestView<SectionID: Hashable, T: NSManagedObject, Content: View>: View {
    
    @SectionedFetchRequest private var results: SectionedFetchResults<SectionID, T>
    private let content: (SectionedFetchResults<SectionID, T>) -> Content
    
    public init(
        _ request: SectionedFetchRequest<SectionID, T>,
        @ViewBuilder content: @escaping (SectionedFetchResults<SectionID, T>) -> Content
    ) {
        self._results = request
        self.content = content
    }
    
    public var body: some View {
        content(results)
    }
}

#endif
