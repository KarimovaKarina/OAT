import UIKit

extension UIAccessibilityTraits: CaseIterable {
    public static var allCases: [UIAccessibilityTraits] {
        [.none, .button, .link, .searchField, .image, .selected, .playsSound,
         .keyboardKey, .staticText, .summaryElement, .notEnabled, .updatesFrequently,
        .startsMediaSession, .adjustable, .allowsDirectInteraction, .causesPageTurn,
         .header, .tabBar
        ]
    }
    
    static var mutuallyExclusiveTraits: [UIAccessibilityTraits] {
        [.button, .searchField, .link, .keyboardKey]
    }
    
    var modifiedStringValue: String? {
        switch self {
        case .none:
            return "none"
            
        case .button:
            return "button"
            
        case .link:
            return "link"
            
        case .searchField:
            return "search field"
            
        case .image:
            return "image"
            
        case .selected:
            return "selected"
            
        case .playsSound:
            return "plays sound"
            
        case .keyboardKey:
            return "keyboard key"
            
        case .staticText:
            return "static text"
            
        case .summaryElement:
            return "summary element"
            
        case .notEnabled:
            return "not enabled"
            
        case .updatesFrequently:
            return "updates frequently"
            
        case .startsMediaSession:
            return "starts media session"
            
        case .adjustable:
            return "adjustable"
            
        case .allowsDirectInteraction:
            return "allows direct interaction"
            
        case .causesPageTurn:
            return "causes page turn"
            
        case .header:
            return "header"
            
        case .tabBar:
            return "tab bar"
            
        default:
            return nil
        }
    }
    
    var stringValue: String {
        switch self {
        case .none:
            return "UIAccessibilityTraits.none"
            
        case .button:
            return "UIAccessibilityTraits.button"
            
        case .link:
            return "UIAccessibilityTraits.link"
            
        case .searchField:
            return "UIAccessibilityTraits.searchField"
            
        case .image:
            return "UIAccessibilityTraits.image"
            
        case .selected:
            return "UIAccessibilityTraits.selected"
            
        case .playsSound:
            return "UIAccessibilityTraits.playsSound"
            
        case .keyboardKey:
            return "UIAccessibilityTraits.keyboardKey"
            
        case .staticText:
            return "UIAccessibilityTraits.staticText"
            
        case .summaryElement:
            return "UIAccessibilityTraits.summaryElement"
            
        case .notEnabled:
            return "UIAccessibilityTraits.notEnabled"
            
        case .updatesFrequently:
            return "UIAccessibilityTraits.updatesFrequently"
            
        case .startsMediaSession:
            return "UIAccessibilityTraits.startsMediaSession"
            
        case .adjustable:
            return "UIAccessibilityTraits.adjustable"
            
        case .allowsDirectInteraction:
            return "UIAccessibilityTraits.allowsDirectInteraction"
            
        case .causesPageTurn:
            return "UIAccessibilityTraits.causesPageTurn"
            
        case .header:
            return "UIAccessibilityTraits.header"
            
        case .tabBar:
            return "UIAccessibilityTraits.tabBar"
            
        default:
            return "Unsupported/new"
        }
    }
}
