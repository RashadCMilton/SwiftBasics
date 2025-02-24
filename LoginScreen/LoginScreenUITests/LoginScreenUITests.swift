//
//  LoginScreenUITests.swift
//  LoginScreenUITests
//
//  Created by Rashad Milton on 2/19/25.
//

import XCTest
@testable import LoginScreen
import GoogleSignIn
class LoginScreenUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    // MARK: - UI Element Identification Tests
    
    func testUIElementsExist() throws {
        // Verify all basic UI elements exist
        XCTAssertTrue(app.textFields["Email"].exists)
        XCTAssertTrue(app.textFields["Password"].exists)
        XCTAssertTrue(app.buttons["Sign In"].exists)
        XCTAssertTrue(app.buttons["Sign In with Google"].exists)
        XCTAssertTrue(app.buttons["Forgot Password?"].exists)
        XCTAssertTrue(app.staticTexts["or"].exists)
        XCTAssertTrue(app.staticTexts["Sign Up"].exists)
    }
    
    // MARK: - Empty Fields Validation Tests
    
    func testEmptyEmailAndPassword() throws {
        // Tap sign in without entering credentials
        app.buttons["Sign In"].tap()
        
        // Verify alert appears
        XCTAssertTrue(app.alerts["Validation Error"].exists)
        XCTAssertTrue(app.alerts.staticTexts["Please, fill in email and password"].exists)
        
        // Dismiss alert
        app.alerts.buttons["OK"].tap()
    }
    
    // MARK: - Invalid Email Tests
    
    func testInvalidEmailFormat() throws {
        // Enter invalid email but valid password
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("invalid-email")
        
        let passwordField = app.textFields["Password"]
        passwordField.tap()
        passwordField.typeText("Password123")
        
        // Tap sign in
        app.buttons["Sign In"].tap()
        
        // Verify alert appears with correct error message
        XCTAssertTrue(app.alerts["Validation Error"].exists)
        XCTAssertTrue(app.alerts.staticTexts["Please, enter a valid email"].exists)
        
        // Dismiss alert
        app.alerts.buttons["OK"].tap()
    }
    
    // MARK: - Invalid Password Tests
    
    func testInvalidPasswordFormat() throws {
        // Enter valid email but invalid password
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test@example.com")
        
        let passwordField = app.textFields["Password"]
        passwordField.tap()
        passwordField.typeText("weak")
        
        // Tap sign in
        app.buttons["Sign In"].tap()
        
        // Verify alert appears with correct error message
        XCTAssertTrue(app.alerts["Validation Error"].exists)
       
        app.alerts.buttons["OK"].tap()
    }
    
    // MARK: - Successful Login Test
    
    func testSuccessfulLogin() throws {
        // Enter valid credentials
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test@example.com")
        
        let passwordField = app.textFields["Password"]
        passwordField.tap()
        passwordField.typeText("Password123")
        
        // Tap sign in
        app.buttons["Sign In"].tap()
        
        let navBar = app.cells.staticTexts["delectus aut autem"]
        let exists = navBar.waitForExistence(timeout: 5)
        
        // Verify navigation to task list screen
        XCTAssertTrue(exists)
    }
    

    

    

    // MARK: - Social Sign-In Tests
    
    func testGoogleSignInButton() throws {
        // This test only verifies the button exists and taps it
        // Complete testing would require mock implementation of GoogleSignIn
        
        let googleButton = app.buttons["Sign In with Google"]
        XCTAssertTrue(googleButton.exists)
        googleButton.tap()
        
        // Since we can't fully test third-party auth in UI tests,
        // just verify the button is interactive
        // In a real scenario, you'd mock the GoogleSignIn service
    }
}

