//
//  EditSandbox.swift
//  swift-mh
//
//  Created by Malcolm Hall on 23/02/2026.
//
import CoreData

public struct EditSandbox<T: NSManagedObject> {
    public let context: NSManagedObjectContext
    public let object: T
    
    public static func makeSandbox(
        targetObject: T
    ) -> EditSandbox<T>? {
        guard let context = targetObject.managedObjectContext else { return nil }
        let childContext = NSManagedObjectContext(childOf: context)
        // Fetch the object into the "Sandbox" context
        guard let objectInChild = try childContext.object(with: targetObject.objectID) as? T else { return nil }
        return EditSandbox(context: childContext, object: objectInChild)
    }
}
