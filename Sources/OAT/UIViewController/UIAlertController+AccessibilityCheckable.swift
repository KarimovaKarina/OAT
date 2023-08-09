import UIKit

extension UIAlertController: AccessibilityCheckable {
    func check() -> [any AccessibilityError] {
        guard self.actions.count > 1 else { return [] }
        return self.actions.map { $0.style }.contains(.cancel)
            ? [UIAlertViewControllerError.isNotDismissable]
            : []
    }
}
