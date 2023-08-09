import UIKit

extension UITextView {
    func customCheck() -> [any AccessibilityError] {
        checkKeyboardAndContentType() + attributedText.checkAttributedString()
    }
    
    private func checkAttributedString() -> [any AccessibilityError] {
        self.attributedText.map{ $0.checkAttributedString() } ?? []
    }
}
