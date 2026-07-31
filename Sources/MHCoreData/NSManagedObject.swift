import CoreData

extension NSManagedObject {
    
    /// Generates a type-safe, optimized database-level SELECT DISTINCT query for a specific field.
    /// - Parameter keyPath: The Swift KeyPath of the attribute you want unique values for.
    /// - Returns: An NSFetchRequest configured to return arrays of distinct dictionaries.
    public static func fetchRequestForUniqueValues<Root: NSManagedObject, Value>(
        _ keyPath: KeyPath<Root, Value>
    ) -> NSFetchRequest<NSDictionary> {
        
        // 1. Convert the Swift KeyPath into a Core Data string key path
        let expression = NSExpression(forKeyPath: keyPath)
        let propertyName = expression.keyPath
        
        // 2. Initialize the dictionary-style request
        let request = NSFetchRequest<NSDictionary>(entityName: String(describing: self))
        request.resultType = .dictionaryResultType
        request.returnsDistinctResults = true
        
        // 3. Target only the requested attribute column
        request.propertiesToFetch = [propertyName]
        
        // 4. Order the results sequentially
        request.sortDescriptors = [NSSortDescriptor(key: propertyName, ascending: true)]
        
        return request
    }
    
    /// True if the object passes Core Data insertion rules without throwing.
    public var isValidForInsert: Bool {
        do {
            try validateForInsert()
            return true
        } catch {
            return false
        }
    }
    
    /// Resolves `self` inside a target context, obtaining a permanent ID first if needed.
    public func inContext(_ targetContext: NSManagedObjectContext) -> Self {
        // works even if it is a temporary ID
        return targetContext.object(with: objectID) as! Self
    }
}
