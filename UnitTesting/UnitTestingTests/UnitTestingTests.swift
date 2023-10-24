//
//  UnitTestingTests.swift
//  UnitTestingTests
//
//  Created by koala panda on 2023/10/22.
//

import XCTest
@testable import UnitTesting

final class UnitTestingTests: XCTestCase {
    

    override class func setUp(){
        print("クラスメソッドのsetUp()が呼び出された")
    }
    
    override func setUp(){
        print("インスタンスメソッドのsetUp()が呼び出された")
    }

    
    override func setUpWithError() throws {
        print("インスタンスメソッドのsetUpWithError()が呼び出された")
    }

    
    override class func tearDown(){
        print("クラスメソッドのtearDown()が呼び出された")
    }
    
    override func tearDown(){
        print("インスタンスメソッドのtearDown()が呼び出された")
    }

    override func tearDownWithError() throws {
        print("インスタンスメソッドのtearDownWithError()が呼び出された")
    }


    func testExample() throws {
        print("テストメソッドのtestExample()が呼び出された")
        // 意図的にエラーを発生させる
        XCTFail("Failing")
//        XCTAssert(false, "これはテストの失敗です")
        
        addTeardownBlock {
            print("addTeardownBlockが呼び出された。このブロックは、tearDownWithError()メソッドの前に呼び出されます。")
            print("終わり")
        }
    }

    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
