@testable import OAT

extension ContrastError: CaseIterable {
    public static var allCases: [ContrastError] {
        [
            .contrastRatioLargeText,
            .contrastRatioSmallText
        ]
    }
}
