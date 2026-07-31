//
//  BaseEditor.swift
//  swift-mh
//
//  Created by Malcolm Hall on 09/06/2026.
//


import Foundation
import SwiftData
import Observation

extension ModelContext  {
    /// Creates an isolated scratchpad context and fetches a local sandbox copy of the given item.
    func makeSandbox<T: PersistentModel>(for persistentModelID: T.ID) -> ModelSandbox<T> where T.ID == PersistentIdentifier {
        let sandboxContext = ModelContext(self.container)
        sandboxContext.autosaveEnabled = false
        
        guard let model = sandboxContext.model(for: persistentModelID) as? T else {
            fatalError("Failed to resolve sandbox model for type \(T.self)")
        }
        
        return ModelSandbox(context: sandboxContext, model: model)
    }
    
    
}

struct ModelSandbox<T: PersistentModel>: Identifiable {
    var id: PersistentIdentifier {
        model.persistentModelID
    }
    let context: ModelContext
    let model: T
}
