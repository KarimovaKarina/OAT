import XCTest
@testable import OAT

// contrast ratio calculation https://www.siegemedia.com/contrast-ratio#hsla%280%C2%B0%2C%200%25%2C%200%25%29-on-black
final class ContrastErrorTests: XCTestCase {
    var listOfErrors: [ContrastError] = { ContrastError.allCases }()
    
    func testAll() throws {
         listOfErrors.forEach { error in
            switch error {
            case .contrastRatioLargeText:
                testContrastRatioLargeText()
                
            case .contrastRatioSmallText:
                testContrastRatioSmallText()
            }
        }
        
        testContrastRatioIsAccessible()
    }
}

//MARK: - Negative

extension ContrastErrorTests {
    func testContrastRatioLargeText() {
        let button = UIButton()
        button.titleLabel?.text = "Log in"
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.titleLabel?.textColor = .black
        button.backgroundColor = .black
        
        XCTAssertFalse(button.isAccessible())
    }

    func testContrastRatioSmallText() {
        let button = UIButton()
        button.titleLabel?.text = "Log in"
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.titleLabel?.textColor = .black
        button.backgroundColor = .darkGray
        
        XCTAssertFalse(button.isAccessible())
    }
}

//MARK: - Positive

extension ContrastErrorTests {
    func testContrastRatioIsAccessible() {
        let button = UIButton()
        button.titleLabel?.text = "Log in"
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.titleLabel?.textColor = .black
        button.backgroundColor = .white
        
        XCTAssertTrue(button.isAccessible())
    }
}
