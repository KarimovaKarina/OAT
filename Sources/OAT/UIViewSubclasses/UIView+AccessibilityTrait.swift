import UIKit

extension UIView {
    func checkTraitsConflict() -> [any AccessibilityError] {
        var exclusiveTraits: [UIAccessibilityTraits] = []
        UIAccessibilityTraits.mutuallyExclusiveTraits.forEach { trait in
            if self.accessibilityTraits.contains(trait) {
                exclusiveTraits.append(trait)
            }
        }
        if exclusiveTraits.count <= 1 {
            return []
        } else {
            return [AccessibilityTraitError.traitsConflict(self, exclusiveTraits)]
        }
    }
}
