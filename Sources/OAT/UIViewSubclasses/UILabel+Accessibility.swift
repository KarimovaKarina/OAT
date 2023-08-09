import UIKit

extension UILabel {
    func customCheck() -> [any AccessibilityError] {
        checkAttributedString()
    }
    
    private func checkAttributedString() -> [any AccessibilityError] {
        self.attributedText.map { $0.checkAttributedString() } ?? []
    }
}
