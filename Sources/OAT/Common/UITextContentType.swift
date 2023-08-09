import UIKit

extension UITextContentType {
    var expectedKeyboardType: UIKeyboardType? {
        switch self {
        case .emailAddress,
                .username:
            return .emailAddress
            
        case .telephoneNumber,
                .creditCardNumber:
            return .namePhonePad
            
        default:
            return nil
        }
    }
}

extension UIKeyboardType {
    var title: String {
        switch self {
        case .emailAddress:
            return "`UIKeyboardType.emailAddress`"
        case .namePhonePad:
            return "`UIKeyboardType.namePhonePad`"
        default:
            fatalError("Unexpected Keyboard type")
        }
    }
}
