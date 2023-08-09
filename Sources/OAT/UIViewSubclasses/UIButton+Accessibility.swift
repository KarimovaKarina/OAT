import UIKit

extension UIButton {
    func customChecks() -> [any AccessibilityError] {
        checkTitleAndBackgroundColor()
    }
    
    private func checkTitleAndBackgroundColor() -> [any AccessibilityError]  {
        guard self.isEnabled,
              let font = self.titleLabel?.font.pointSize,
              let isBold = self.titleLabel?.font.isBold
        else { return [] }
        let conditionFont: CGFloat = isBold ? 14 : 18
        let minimumContrast = font < conditionFont ? 4.5 / 1 : 3.0 / 1
        let titleColor = self.titleLabel?.textColor ?? currentTitleColor
        if let backgroundColor = self.backgroundColor {
            let actualContrast = UIColor.contrastRatio(between: titleColor, and: backgroundColor)
            return actualContrast < minimumContrast ? [ContrastError.contrastRatioSmallText] : []
        } else {
            return []
        }
    }
}
