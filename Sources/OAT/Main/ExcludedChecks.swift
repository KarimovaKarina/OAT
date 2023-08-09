import UIKit

public enum ExcludedChecks {
    case images
}

extension ExcludedChecks {
    func shouldBeExcluded(_ item: AnyObject) -> Bool {
        switch self {
        case .images:
            return item is UIImageView
        }
    }
}

extension [ExcludedChecks] {
    func shouldBeExcluded(_ item: AnyObject) -> Bool {
        for rule in self {
            if rule.shouldBeExcluded(item) {
                return true
            }
        }
        
        return false
    }
}
