import XCTest
import UIKit

public func checkAccessibility(
    _ view: UIView,
    with settings: AccessibilitySettings = .default,
    file: StaticString = #file,
    testName: String = #function,
    line: UInt = #line
) {
    let errors = collectErrors(for: view, with: settings)
    errors.forEach { error in
        XCTFail("\n -> " + error.errorMessage, file: file, line: line)
    }
}

// inernal for tests invokations
func collectErrors(
    for view: UIView,
    with settings: AccessibilitySettings = .default
) -> [AccessibilityError] {
    guard !settings.excluding.shouldBeExcluded(view)
    else { return [] }
    
    let accessibilityErrors = settings.recursiveChecking
        ? view.recursiveCheck(with: settings.excluding)
        : view.check()
    
    let duplicatesErrors = UIView.checkDuplicates(for: view)

    return accessibilityErrors + duplicatesErrors
}


extension UIView {
    func isAccessible() -> Bool {
        collectErrors(for: self, with: .default).isEmpty
    }
}
