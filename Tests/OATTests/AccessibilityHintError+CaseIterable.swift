@testable import OAT

extension AccessibilityHintError: CaseIterable {
    public static var allCases: [AccessibilityHintError] {
        [
            .hintIsEmpty,
            .containsLabel("Log in"),
            .containsType(["button"]),
            .doesNotEndWithPeriod,
            .firstWordIsNotCapitalized
        ]
    }
}
