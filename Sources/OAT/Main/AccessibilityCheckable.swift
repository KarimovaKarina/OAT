import UIKit

protocol AccessibilityCheckable {
    func check() -> [any AccessibilityError]
}

extension AccessibilityCheckable {
    func isAccessible() -> Bool {
        check().isEmpty
    }
}
