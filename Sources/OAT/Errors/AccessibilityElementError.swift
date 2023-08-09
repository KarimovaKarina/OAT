import UIKit

enum AccessibilityElementError: Error {
    case isNotAccessibilityElement(UIView)
}

extension AccessibilityElementError: AccessibilityError {
    var errorMessage: String {
        switch self {
        case let .isNotAccessibilityElement(type):
            return """
            Element is not accessibilityElement by default. If it contains important content, set isAccessibilityElement property to true, otherwise disable this error. \n
            UI element description: \(type.description)
            """
        }
    }
}
