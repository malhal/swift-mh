//
//  ForEachModel.swift
//  swift-mh
//
//  Created by Malcolm Hall on 12/02/2026.
//
import SwiftData
#if canImport(SwiftUI)
import SwiftUI

public struct ForEachModel<T: PersistentModel, Content: View>: View {
    
    @Query var results: [T]
    let content: (T) -> Content
    
    public init(_ query: Query<T, [T]>, content: @escaping (T) -> Content) {
        _results = query
        self.content = content
    }
    
    public var body: some View {
        ForEach(results) { item in
            content(item)
        }
    }
}
#endif
