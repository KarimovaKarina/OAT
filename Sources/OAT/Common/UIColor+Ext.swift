import UIKit

extension UIColor {
    static func contrastRatio(between color1: UIColor, and color2: UIColor) -> CGFloat {
        let luminance1 = color1.luminance()
        let luminance2 = color2.luminance()

        let luminanceDarker = min(luminance1, luminance2)
        let luminanceLighter = max(luminance1, luminance2)

        return (luminanceLighter + 0.05) / (luminanceDarker + 0.05)
    }

    private func luminance() -> CGFloat {
        //https://www.w3.org/TR/WCAG20-TECHS/G18.html#G18-tests
        let ciColor = CIColor(color: self)

        func adjust(colorComponent: CGFloat) -> CGFloat {
            (colorComponent < 0.04045)
                ? (colorComponent / 12.92)
                : pow((colorComponent + 0.055) / 1.055, 2.4)
        }

        return 0.2126 * adjust(colorComponent: ciColor.red)
                + 0.7152 * adjust(colorComponent: ciColor.green)
                + 0.0722 * adjust(colorComponent: ciColor.blue)
    }
}
