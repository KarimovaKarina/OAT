import Foundation

enum TargetSizeErrror {
    case isSmall(CGSize)
}

extension TargetSizeErrror: AccessibilityError {
    var errorMessage: String {
        switch self {
        case let .isSmall(size):
            return """
Touch target of an element should be at least 44x44 pt. Current heght is \(size.height) and width is \(size.width)
"""
        }
    }
}
