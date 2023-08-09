import UIKit

extension UIView {
    static var internalClassNames: [String] {
        ["UIButtonLabel"]
    }
    
    func recursiveCheck(with excluding: [ExcludedChecks]) -> [any AccessibilityError] {
        guard
            !excluding.shouldBeExcluded(self),
            !Self.internalClassNames.contains(Self.description())
        else { return [] }
            
        let errorsOfParentView = self.check()
       
        let errorsOfChildViews = subviews
            .filter { !shouldSkip(parent: self, child: $0) }
            .map { $0.recursiveCheck(with: excluding) }
            .flatMap { $0 }

        return errorsOfParentView + errorsOfChildViews
    }
    
    // TODO: Refactor this part, as checks on contrast ratio of image and button
    // itself will require
    private func shouldSkip(parent: UIView, child: UIView) -> Bool {
        parent.className == "UIButton" && child.className == "UIImageView"
    }
}
