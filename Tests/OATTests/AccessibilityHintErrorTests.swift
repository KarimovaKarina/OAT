import XCTest
@testable import OAT

final class AccessibilityHintErrorTests: XCTestCase {
    var listOfErrors: [AccessibilityHintError] = { AccessibilityHintError.allCases }()
    
    func testAll() throws {
         listOfErrors.forEach { error in
            switch error {
            case .hintIsEmpty:
                testHintIsEmpty()
                
            case .containsLabel:
                testHintContainsLabel()
                
            case .doesNotEndWithPeriod:
                testHintDoesNotEndWithPeriod()
                
            case .containsType:
                testHintContainsType()
                
            case .firstWordIsNotCapitalized:
                testHintFirstWordIsNotCapitalized()
            }
        }
        
        testHintIsAccessible()
    }
}

//MARK: - Negative

extension AccessibilityHintErrorTests {
    func testHintIsEmpty() {
        let button = UIButton()
        button.accessibilityLabel = "Log in"
        button.accessibilityHint = ""

        XCTAssertFalse(button.isAccessible())
    }

    func testHintContainsLabel() {
        let button = UIButton()
        button.accessibilityLabel = "Log in"
        button.accessibilityHint = "Log in starts session."
        
        XCTAssertFalse(button.isAccessible())
    }
    
    func testHintDoesNotEndWithPeriod() {
        let button = UIButton()
        button.accessibilityLabel = "Log in"
        button.accessibilityHint = "Starts session"
        
        XCTAssertFalse(button.isAccessible())
    }
    
    func testHintContainsType() {
        let button = UIButton()
        button.accessibilityLabel = "Log in"
        button.accessibilityHint = "Button that starts session."
        
        XCTAssertFalse(button.isAccessible())
    }
    
    func testHintFirstWordIsNotCapitalized() {
        let button = UIButton()
        button.accessibilityLabel = "Log in"
        button.accessibilityHint = "starts session."
        
        XCTAssertFalse(button.isAccessible())
    }
}

//MARK: - Positive

extension AccessibilityHintErrorTests {
    func testHintIsAccessible() {
        let button = UIButton()
        button.accessibilityLabel = "Log in"
        button.accessibilityHint = "Starts session."
        
        XCTAssertTrue(button.isAccessible())
    }
}
