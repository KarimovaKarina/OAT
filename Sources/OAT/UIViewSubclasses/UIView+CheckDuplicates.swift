import UIKit

extension NSObject {
    var className: String {
        Self.description()
    }
}

extension UIView {
    static private func subviewLabels(for view: UIView) -> [String] {
        guard !Self.internalClassNames.contains(view.className)
        else { return [] }
        let parentLabel = [view.actualAccessibilityLabel]
        let childLabels = view.subviews.map { subviewLabels(for: $0) }.flatMap { $0 }
        return (parentLabel + childLabels).compactMap { $0 }
    }
    
    static func checkDuplicates(for view: UIView) -> [any AccessibilityError] {
        var labelsSet = Set<String>()
        let labels = subviewLabels(for: view)
        var duplicate = [String]()
        labels.forEach { label in
            if labelsSet.contains(label) {
                duplicate.append(label)
            } else {
                labelsSet.insert(label)
            }
        }

        return duplicate.map { AccessibilityLabelError.duplicated(view, $0) }
    }
}
