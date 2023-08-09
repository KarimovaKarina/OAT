enum ContrastError {
    case contrastRatioSmallText
    case contrastRatioLargeText
}

extension ContrastError: AccessibilityError {
    var errorMessage: String {
        switch self {
        case .contrastRatioSmallText:
            return "Contrast ratio should be at least 4.5:1 for small text (below 18 point regular or 14 point bold)"
            
        case .contrastRatioLargeText:
            return "Contrast ratio should be at least 3.0:1 for large text (18 point and above regular or 14 point and above bold)"
        }
    }
}
