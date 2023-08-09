import UIKit

extension UIView: AccessibilityCheckable {
    func check() -> [any AccessibilityError] {
        if self is UIControl {
            return checkAccessibleElement()
        } else if self is UIImageView {
            guard isAccessibilityElement else {
                return [AccessibilityElementError.isNotAccessibilityElement(self)]
            }
            return checkAccessibleElement()
        } else {
            guard isAccessibilityElement else { return [] }
            return checkAccessibleElement()
        }
    }
    
    private func checkAccessibleElement() -> [any AccessibilityError] {
        var errors: [AccessibilityError] = []
        
        errors += checkAccessiblityLabel()
        errors += checkAccessibilityHint()
        errors += checkTraitsConflict()
        errors += checkSubclasses()
        errors += checkTargetSize()
        
        return errors
    }
    
    private func checkSubclasses() -> [any AccessibilityError] {
        var errors: [AccessibilityError] = []
        if let textView = self as? UITextView {
            errors += textView.customCheck()
            
        } else if let label = self as? UILabel {
            errors += label.customCheck()
            
        } else if let button = self as? UIButton {
            errors += button.customChecks()
            
        } else if let textField = self as? UITextField {
            errors += textField.customCheck()
        }
        
        return errors
    }
}
