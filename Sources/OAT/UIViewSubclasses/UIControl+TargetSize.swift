import UIKit

extension UIView {
    func checkTargetSize() -> [any AccessibilityError] {
        guard self.translatesAutoresizingMaskIntoConstraints,
              let control = self as? UIControl
        else { return [] }
        
        return (control.frame.width < 44 || control.frame.height < 44)
            ? [TargetSizeErrror.isSmall(control.frame.size)]
            : []
    }
}
