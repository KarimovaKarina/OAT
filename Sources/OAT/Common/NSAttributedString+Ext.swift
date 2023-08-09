import Foundation
import UIKit

extension NSAttributedString {
    func checkAttributedString() -> [any AccessibilityError] {
        guard !self.string.isEmpty else {return []}
        var errors: [AccessibilityError] = []
        for i in 0...self.string.count-1 {
            let startIndex = self.string.startIndex
            let index1 = self.string.index(startIndex, offsetBy: i)
            let location = self.string.distance(from: startIndex, to: index1)
            let paragraphStyle = self.attribute(.paragraphStyle, at: location, longestEffectiveRange: .none, in: .init(location: location, length: 1))
            let attrFont = self.attribute(.font, at: location, longestEffectiveRange: .none, in: .init(location: location, length: 1))
            let kern = self.attribute(.kern, at: location, longestEffectiveRange: .none, in: .init(location: location, length: 1))
            var tracking: NSNumber?
            if #available(iOS 14.0, *) {
                tracking = self.attribute(.tracking, at: location, longestEffectiveRange: .none, in: .init(location: location, length: 1)) as? NSNumber
            }

            guard let paragraphStyle = paragraphStyle as? NSParagraphStyle,
                  let fontSize = (attrFont as? UIFont)?.pointSize
            else { return errors }
            
            errors.append(contentsOf: checkLineSpacingHeight(paragraphStyle, fontSize))
            
            guard let kern = kern as? NSNumber,
                  let fontSize = (attrFont as? UIFont)?.pointSize
            else { return errors }
            errors.append(contentsOf: checkKernTracking(kern, tracking, fontSize))
        }
        
        return errors
    }
    
    private func checkLineSpacingHeight(_ paragraphStyle: NSParagraphStyle, _ fontSize: CGFloat) -> [AccessibilityError] {
        let minimumSpacingHeight = fontSize * 1.5
    
        guard paragraphStyle.lineSpacing < minimumSpacingHeight
                && (paragraphStyle.minimumLineHeight < minimumSpacingHeight)
                && paragraphStyle.lineHeightMultiple < 1.5
        else {
            return []
        }
        return [NSAttributedStringError.lineSpacingHeight]
    }
    
    private func checkParagraphSpacing(_ paragraphStyle: NSParagraphStyle, _ fontSize: CGFloat) -> [AccessibilityError] {
        let minimumParagraphSpacing = fontSize * 2
        guard paragraphStyle.paragraphSpacing < minimumParagraphSpacing
                && paragraphStyle.paragraphSpacingBefore < minimumParagraphSpacing
        else { return [] }
        
        return [NSAttributedStringError.paragraphSpacing]
    }
    
    private func checkKernTracking(_ kern: NSNumber, _ tracking: NSNumber?, _ fontSize: CGFloat) -> [AccessibilityError] {
        
        let minimumKernTracking = fontSize * 0.12
        
        guard CGFloat(truncating: kern) < minimumKernTracking
                && (tracking != nil && CGFloat(truncating: tracking!) < minimumKernTracking)
        else { return [] }
        
        return [NSAttributedStringError.kernTracking]
    }
}
