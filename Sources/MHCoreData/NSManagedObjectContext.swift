//
//  NSManagedObjectContext.swift
//  swift-mh
//
//  Created by Malcolm Hall on 19/02/2026.
//

import CoreData

extension NSManagedObjectContext {

    /// Initializes a new child context and if conncurency type nil it uses the same concurrency type as its parent.
    public convenience init(childOf parent: NSManagedObjectContext, concurrencyType: NSManagedObjectContextConcurrencyType? = nil) {
        
        let resolvedConcurrencyType = concurrencyType ?? parent.concurrencyType
        
        // 1. Call the designated initializer
        self.init(concurrencyType: resolvedConcurrencyType)
        
        // 2. Set the parent
        self.parent = parent
        
        // 3. Optional: Set a name for debugging
        self.name = "Child of \(parent.name ?? "unnamed context")"
        
        self.automaticallyMergesChangesFromParent = true
    }
 
    
}
