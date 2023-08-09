import Foundation

enum NSAttributedStringError {
    case lineSpacingHeight
    case paragraphSpacing
    case kernTracking
}

extension NSAttributedStringError: AccessibilityError {
    var errorMessage: String {
        switch self {
        case .lineSpacingHeight:
            return "lineSpace should be at least 1.5 times the font size or minimumLineHeight (lineHeightMultiple) should be at least 1.5"
            
        case .paragraphSpacing:
            return "paragraphSpacing (paragraphSpacingBefore) should be at least 2 times the font size"
            
        case .kernTracking:
            return "kern (tracking) should be at least 0.12 times the font size"
        }
    }
}
