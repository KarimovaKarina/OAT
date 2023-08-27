# OAT

Open Accessibility Testing (OAT)is a tool for iOS automated accessibiity testing.

# Installation
OAT uses Swift Pacakge Manager for distribution.

```
.package(url: "https://github.com/KarimovaKarina/OAT.git", from: "main")
```

# Usage

Add OAT package to test target. Import OAT into test file and call a public function checkAccessibility that takes the following parameters:

 * view - the view you want to test for accessibility faults;
 * settings - value of type AccessibilitySettings:
   * excluding - type of views you do not qwant to test
   * recursiveChecking - boolean value, indicating whether you want to test subbviews or not.

# Extension

The Quality Assurance of the tool is provided by unit tests for negative and positive scenarios. If a new type of accessibility errors will be added they should be covered by tests.
