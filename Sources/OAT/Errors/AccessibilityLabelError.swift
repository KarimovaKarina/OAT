import UIKit

enum AccessibilityLabelError {
    case labelIsMissing(UIView)
    case labelIsEmpty(UIView)
    case containsType(UIView, [String])
    case firstWordIsNotCapitalized(UIView)
    case endsWithPeriod(UIView)
    case duplicated(UIView, String)
}

extension AccessibilityLabelError: AccessibilityError {
    var errorMessage: String {
        switch self {
        case let .labelIsMissing(type):
            return """
            accessibilityLabel or its default value by means of element title/text are missing. \n
            UI element description: \(type.description)
            """
            
        case let .labelIsEmpty(type):
            return """
            'accessibilityLabel' should not be empty string.\n
            UI element description: \(type.description)
            """
            
        case let .containsType(type, stopWords):
            return """
            'accessibilityLabel' should not include the type of the control or view, as it should be set in 'accessibilityTrait'. Please, substitute the following words \(stopWords).\n
            UI element description: \(type.description)
            """
            
        case let .firstWordIsNotCapitalized(type):
            return """
            accessibilityLabel should begin with a capitalized word. This helps VoiceOver read the label with the appropriate inflection.\n
            UI element description: \(type.description)
            """
            
        case let .endsWithPeriod(type):
            return """
            'accessibilityLabel' is not a sentence and therefore should not end with a period.\n
            UI element description: \(type.description)
            """
            
        case let .duplicated(type, label):
            return """
            'accessibilityLabel' value '\(label)' is duplicated. \n
            UI element description: \(type.description)
            """
        }
    }
}

extension AccessibilityLabelError {
    static var stopWords: [String] {
        UIAccessibilityTraits.allCases.compactMap { $0.modifiedStringValue }
    }
}
