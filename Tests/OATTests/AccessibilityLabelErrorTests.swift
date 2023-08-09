import XCTest
@testable import OAT

final class AccessibilityLabelErrorTests: XCTestCase {
    var listOfErrors: [AccessibilityLabelError] = { AccessibilityLabelError.allCases }()
    
    func testAll() throws {
         listOfErrors.forEach { error in
            switch error {
            case .labelIsMissing:
                testLabelIsMissing()
                
            case .labelIsEmpty:
                testLabelIsEmpty()
                
            case .endsWithPeriod:
                testLabelEndsWithPeriod()
                
            case .containsType:
                testLabelContainsType()
                
            case .firstWordIsNotCapitalized:
                testLabelFirstWordIsNotCapitalized()
            
            case .duplicated:
                break
                // TODO: ME
            }
        }
        
        testLabelIsAccessible()
        testCurrentTitleIsAccessible()
        testTitleLabelIsAccessible()
    }
}

//MARK: - Negative

extension AccessibilityLabelErrorTests {
    func testLabelIsMissing() {
        let button = UIButton()

        XCTAssertFalse(button.isAccessible())
    }

    func testLabelIsEmpty() {
        let button = UIButton()
        button.accessibilityLabel = ""
        
        XCTAssertFalse(button.isAccessible())
    }
    
    func testLabelEndsWithPeriod() {
        
        let button = UIButton()
        button.accessibilityLabel = "Name."
                
        XCTAssertFalse(button.isAccessible())
    }
    
    func testLabelContainsType() {
        let button = UIButton()
        button.accessibilityLabel = "button"
                
        XCTAssertFalse(button.isAccessible())
    }
    
    func testLabelFirstWordIsNotCapitalized() {
        let button = UIButton()
        button.accessibilityLabel = "Button"
                
        XCTAssertFalse(button.isAccessible())
    }
    
    func testDuplicated() {
        let button1 = UIButton()
        button1.accessibilityLabel = "Register"
        
        let button2 = UIButton()
        button2.accessibilityLabel = "Register"
        
        let view = UIView()
        view.accessibilityLabel = ""
        view.isAccessibilityElement = true
        view.addSubview(button1)
        view.addSubview(button2)
                
//        let errors = collectErrors(for: view, with: .default)
        
        XCTAssertFalse(view.isAccessible())
//        view.recursiveCheck(with: []).forEach { error in
//            XCTAssert(false, error.errorMessage)
//        }
    }
}

//MARK: - Positive

extension AccessibilityLabelErrorTests {
    func testLabelIsAccessible() {
        let button = UIButton()
        button.accessibilityLabel = "Log in"
                
        XCTAssertTrue(button.isAccessible())
    }
    
    func testCurrentTitleIsAccessible() {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
                
        XCTAssertTrue(button.isAccessible())
    }
    
    func testTitleLabelIsAccessible() {
        let button = UIButton()
        button.titleLabel?.text = "Log in"
                
        XCTAssertTrue(button.isAccessible())
    }
}
