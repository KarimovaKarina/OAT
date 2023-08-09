import UIKit

extension UITextInput {
    func checkKeyboardAndContentType() -> [any AccessibilityError] {
        var errors: [AccessibilityError] = []

        let textInput = self
        guard let textContentType = textInput.textContentType else {
            return []
        }

        guard let textContentType = textContentType else {
            return []
        }

        if let expectedKeyboardType = textContentType.expectedKeyboardType,
            textInput.keyboardType != expectedKeyboardType {
            errors.append(TextInputError.keyboardAndContentTypeAreNotMatching(expectedKeyboardType, textContentType))
        }

        return errors
    }
}


