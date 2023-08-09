import UIKit

enum AccessibilityHintError: Error {
    case hintIsEmpty
    case containsType([String])
    case firstWordIsNotCapitalized
    case doesNotEndWithPeriod
    case containsLabel(String)
}

extension AccessibilityHintError: AccessibilityError {
    var errorMessage: String {
        switch self {
        case .hintIsEmpty:
            return "'accessibilityHint' should not be empty string."
            
        case let .containsType(stopWords):
            return "'accessibilityHint' should not include the type of the control or view. Please, substitute the following words \(stopWords)."
            
        case .firstWordIsNotCapitalized:
            return "'accessibilityHint' should begin with a capitalized word. This helps VoiceOver read the hint with the appropriate inflection."
            
        case .doesNotEndWithPeriod:
            return "'accessibilityHint' should end with a period."
            
        case let .containsLabel(text):
            return "'accessibilityHint' should not repeat label (accessibilityLabel or its dedault value by means of element title/text). Please, substitute the following text \(text)."
        }
    }
}

extension AccessibilityHintError {
    static var stopWords: [String] {
        UIAccessibilityTraits.allCases.compactMap { $0.modifiedStringValue }
    }
}
