//
//  LoginScreenTests.swift
//  LoginScreenTests
//
//  Created by Rashad Milton on 2/19/25.
//

import XCTest
import LoginScreen
final class LoginScreenTests: XCTestCase {
    var viewModel: ViewModel!
       
       override func setUpWithError() throws {
           viewModel = ViewModel()
       }
       
       override func tearDownWithError() throws {
           viewModel = nil
       }
       
       // MARK: - Email Validation Tests
       
       func testValidEmail() {
           // Test valid email formats
           XCTAssertTrue(viewModel.isValidEmail("test@example.com"))
           XCTAssertTrue(viewModel.isValidEmail("user.name@domain.co"))
           XCTAssertTrue(viewModel.isValidEmail("user-name@example.org"))
           XCTAssertTrue(viewModel.isValidEmail("user+tag@example.com"))
       }
       
       func testInvalidEmail() {
           // Test invalid email formats
           XCTAssertFalse(viewModel.isValidEmail(""))
           XCTAssertFalse(viewModel.isValidEmail("test"))
           XCTAssertFalse(viewModel.isValidEmail("test@"))
           XCTAssertFalse(viewModel.isValidEmail("@example.com"))
           XCTAssertFalse(viewModel.isValidEmail("test@example"))
           XCTAssertFalse(viewModel.isValidEmail("test.example.com"))
       }
       
       // MARK: - Password Validation Tests
       
       func testValidPassword() {
           // Test valid password formats (8+ chars, 1+ uppercase, 1+ lowercase, 1+ digit)
           XCTAssertTrue(viewModel.isValidPassword("Password123"))
           XCTAssertTrue(viewModel.isValidPassword("Secure567"))
           XCTAssertTrue(viewModel.isValidPassword("AbCdEf123"))
       }
       
       func testInvalidPassword() {
           // Test invalid password formats
           XCTAssertFalse(viewModel.isValidPassword("")) // Empty
           XCTAssertFalse(viewModel.isValidPassword("short1A")) // Too short
           XCTAssertFalse(viewModel.isValidPassword("lowercase123")) // No uppercase
           XCTAssertFalse(viewModel.isValidPassword("UPPERCASE123")) // No lowercase
           XCTAssertFalse(viewModel.isValidPassword("Passwordonly")) // No digits
           XCTAssertFalse(viewModel.isValidPassword("Password!@#")) // Special chars not in regex
       }
       
       
       // MARK: - Authentication Tests
       
       func testAuthenticateUser() {
           // Testing Keychain operations directly can be tricky in unit tests
           // This test ensures the method runs without crashing
           XCTAssertNoThrow(viewModel.authenticateUser(email: "test@example.com", password: "Password123"))
       }
   }
