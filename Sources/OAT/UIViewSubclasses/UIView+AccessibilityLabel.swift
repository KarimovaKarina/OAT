import UIKit

extension UIView {
    // this property is used in AccessibilityHint checks to identify
    // if hint contains the same string as accesibilityLabel
    var actualAccessibilityLabel: String? {
        if let button = self as? UIButton {
            let defaultAccessibilityLabel = button.titleLabel?.text ?? button.currentTitle
            return self.accessibilityLabel ?? defaultAccessibilityLabel
        } else {
            return accessibilityLabel
        }
    }
    
    func checkAccessiblityLabel() -> [any AccessibilityError] {
        guard let accessibilityLabel = actualAccessibilityLabel else {
            return [AccessibilityLabelError.labelIsMissing(self)]
        }
        
        guard !accessibilityLabel.isEmpty else {
            return [AccessibilityLabelError.labelIsEmpty(self)]
        }
        
        var errors: [AccessibilityError] = []
        if !accessibilityLabel.isCapitalized() {
            errors.append(AccessibilityLabelError.firstWordIsNotCapitalized(self))
        }
        
        if accessibilityLabel.endsWithPeriod() {
            errors.append(AccessibilityLabelError.endsWithPeriod(self))
        }
       
        let stopWords = AccessibilityLabelError.stopWords
            .filter{ accessibilityLabel.lowercased().contains($0) }
        if !stopWords.isEmpty {
            errors.append(AccessibilityLabelError.containsType(self, stopWords))
        }

        return errors
    }
}
