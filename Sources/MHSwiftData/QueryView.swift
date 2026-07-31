//
//  QueryView.swift
//  swift-mh
//
//  Created by Malcolm Hall on 12/02/2026.
//
import SwiftData
#if canImport(SwiftUI)
import SwiftUI

public struct QueryView<T: PersistentModel, Content: View>: View {
    
    @Query var results: [T]
    let content: (Context) -> Content
    
    public init(_ query: Query<T, [T]>, content: @escaping (Context) -> Content) {
        self._results = query
        self.content = content
    }
    
    public var body: some View {
        content(Context(results: results, error: _results.fetchError, modelContext: _results.modelContext))
    }
    
    public struct Context {
        let results: [T]
        let error: Error?
        let modelContext: ModelContext
    }
}
#endif
