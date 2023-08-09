enum UIAlertViewControllerError {
    case isNotDismissable
}

extension UIAlertViewControllerError: AccessibilityError {
    var errorMessage: String {
        switch self {
        case .isNotDismissable:
            return "'UIAlertViewController' should have action with cancel style"
        }
    }
}
