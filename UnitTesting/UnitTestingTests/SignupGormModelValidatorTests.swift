//
//  SignupGormModelValidator.swift
//  UnitTestingTests
//
//  Created by koala panda on 2023/11/06.
//

import XCTest


@testable import UnitTesting

class SignupFormModelValidatorTests: XCTestCase {
    

    var sut: SignupFormModelValidator!

    override func setUp() {
        //各テストが実行される前に新しいSignupFormModelValidatorインスタンスを用意
        sut = SignupFormModelValidator()
    }

    override func tearDown() {
        //テストメソッドの実行後にsutオブジェクトへの参照を解放する(メモリリークを防ぐためのクリーンアップ)
        sut = nil
    }
    
    
    
    // MARK: First Name Validation Unit Tests
    
    ///test[関数名やクラス名など、テストの対象となるシステムの名前]\_[何が起きたら]\_[どのような結果を期待しているか等合格の条件]
    /*
    - Arrange(調整)ブロック
    - テストに必要な変数を全て記述する
    - Act(行動)
    - テスト対象のメソッドを呼び出す、結果を変数に格納する
    - Assert(主張)
    - テストアサーションを使用し、テストをパスしたか検証する
     */
    
    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        // Arrange
        ///var sut = SignupFormModelValidator()
        ///いちいち書かなくても、func setUp()に一度書けば他のメソッドで共有できる
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Sergey")
        
        // Assert
        ///単体テストが失敗した理由を説明する説明メッセージ
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }
    
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {

        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "S")

        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than characters but it has returned TRUE")

    }
//
//    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
//
//        let isFirstNameValid = sut.isFirstNameValid(firstName: "SergeySergey")
//
//        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE")
//    }
//
//    // MARK: Last Name Validation Unit Tests
//    func testSignFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
//
//        // Arrange
//        // Act
//        let isLastNameValid = sut.isLastNameValid(lastName: "Kargopolov")
//
//        // Assert
//        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but returned FALSE")
//    }
//
//    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
//
//        // Arrange
//        // Act
//        let isLastNameValid = sut.isLastNameValid(lastName: "K")
//
//        // Assert
//        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is shorter than \(SignupConstants.lastNameMinLength) characters but it has returned TRUE")
//
//    }
//
//    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
//
//        let isLastNameValid = sut.isLastNameValid(lastName: "KargopolovKargopolov")
//
//        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is longer than \(SignupConstants.lastNameMaxLength) characters but it has returned TRUE")
//    }
//
//    // MARK: Email Address Validation
//    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
//        let isValidEmailFormat = sut.isValidEmailFormat(email: "test@test.com")
//
//        XCTAssertTrue(isValidEmailFormat, "Provided valid email address format but validation did not pass")
//    }
//
//    func testSignupFormModelValidator_WhenInValidEmailProvided_ShouldReturnFalse() {
//        let isValidEmailFormat = sut.isValidEmailFormat(email: "test@test")
//
//        XCTAssertFalse(isValidEmailFormat, "Provided invalid email address format but validation still passed")
//    }
//
//    // MARK: Password Validation
//    func testSignupFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
//
//        // Act
//        let isPasswordValid = sut.isPasswordValid(password: "12345678")
//
//        // Assert
//        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned TRUE for a valid password  but it has returned FALSE")
//
//    }
//
//    func testSignupFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
//
//        // Act
//        let isPasswordValid = sut.isPasswordValid(password: "12")
//
//        // Assert
//        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is shorter than \(SignupConstants.passwordMinLength) but it has returned TRUE")
//
//    }
//
//    func testSignupFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
//
//        // Act
//        let isPasswordValid = sut.isPasswordValid(password: "12345678901234567")
//
//        // Assert
//        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is longer than \(SignupConstants.passwordMaxLength) but it has returned TRUE")
//
//    }
//
//    func testSignupFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue() {
//        // Act
//        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword:"12345678")
//
//        // Assert
//        XCTAssertTrue(doPasswordsMatch, "The doPasswordsMatch() should have returned TRUE for matching passwords but it has returned FALSE")
//    }
//
//    func testSignupFormModelValidator_WhenNotMatchingPasswordsProvided_ShouldReturnFalse() {
//        // Act
//        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword: "1234678")
//
//        // Assert
//        XCTAssertFalse(doPasswordsMatch, "The doPasswordsMatch() should have returned FALSE for passwords that do not match but it has returned TRUE")
//    }
}
