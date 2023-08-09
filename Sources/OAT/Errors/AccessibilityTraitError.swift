import UIKit

enum AccessibilityTraitError: Error {
    case isMissing
    case traitsConflict(UIView, [UIAccessibilityTraits])
}

extension AccessibilityTraitError: AccessibilityError {
    var errorMessage: String {
        switch self {
        case .isMissing:
            return "AccessiblityTrait is missing"
            
        case let.traitsConflict(type, traits):
            return """
accessibilityTraits for element are conflicting. The following traits are mutually exclusive: \(traits.map {$0.stringValue + " "}) \n

UI element description: \(type.description)
"""
        }
    }
}
