@testable import OAT
import UIKit

extension AccessibilityLabelError: CaseIterable {
    public static var allCases: [AccessibilityLabelError] {
        [
            .labelIsMissing(UIView()),
            .labelIsEmpty(UIView()),
            .firstWordIsNotCapitalized(UIView()),
            .endsWithPeriod(UIView()),
            .containsType((UIView()), ["button"])
        ]
    }
}
