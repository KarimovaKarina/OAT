public struct AccessibilitySettings {
    let excluding: [ExcludedChecks]
    let recursiveChecking: Bool
    
    public  init(excluding: [ExcludedChecks], recursiveChecking: Bool) {
        self.excluding = excluding
        self.recursiveChecking = recursiveChecking
    }
}

public extension AccessibilitySettings {
    static var `default`: Self {
        .init(excluding: [], recursiveChecking: true)
    }
}
