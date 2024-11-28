//
//  LearnConnectTests.swift
//  LearnConnectTests
//
//  Created by Berkay Emre Aslan on 27.11.2024.
//
import FirebaseAuth
import XCTest
@testable import LearnConnect

final class LearnConnectTests: XCTestCase {
    var viewModel: LoginViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    
    func testValidate_EmptyFields() {
            viewModel.email = ""
            viewModel.password = ""
            
            let result = viewModel.validate()
            
            XCTAssertFalse(result, "Boş alanlarla doğrulama geçmemeli.")
            XCTAssertEqual(viewModel.errorMessage, "Lütfen bütün bilgileri giriniz.")
        }
    
    func testValidate_InvalidEmail() {
            viewModel.email = "testemail"
            viewModel.password = "password123"
            
            let result = viewModel.validate()
            
            XCTAssertFalse(result, "Geçersiz email doğrulama geçmemeli.")
            XCTAssertEqual(viewModel.errorMessage, "Lütfen uygun email giriniz.")
        }
    
    func testValidate_ValidInput() {
            viewModel.email = "test@example.com"
            viewModel.password = "password123"
            
            let result = viewModel.validate()
            
            XCTAssertTrue(result, "Geçerli bilgilerle doğrulama başarısız oldu.")
            XCTAssertEqual(viewModel.errorMessage, "")
        }
    
    func testLogin_CallsFirebaseAuth() {
            viewModel.email = "test@example.com"
            viewModel.password = "password123"
            
            let result = viewModel.validate()
            
            XCTAssertTrue(result, "Geçerli bilgilerle login başarısız oldu.")
            // Firebase login işlemini gerçek bir işlem yerine mocklama ile test edin
        }
    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}





