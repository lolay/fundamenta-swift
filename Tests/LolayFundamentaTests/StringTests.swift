//
//  Copyright © 2019, 2023 Lolay, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import XCTest
@testable import LolayFundamenta

class StringTests: XCTestCase {
    func testRandomString() {
        let defaultString = String.randomString()
        XCTAssertEqual(defaultString.count, 16)
        
        let string0 = String.randomString(length: 0)
        XCTAssertEqual(string0.count, 0)
        
        let string4 = String.randomString(length: 4)
        XCTAssertEqual(string4.count, 4)
        
        let string20 = String.randomString(length: 20)
        XCTAssertEqual(string20.count, 20)
    }
    
    func testIsEmail() {
        XCTAssertTrue("build@lolay.org".isEmail)
        XCTAssertTrue("build+xctest@lolay.org".isEmail)
        XCTAssertTrue("build@build.lolay.org".isEmail)
        XCTAssertFalse("build".isEmail)
        XCTAssertFalse("build@".isEmail)
        XCTAssertFalse("build@lolay".isEmail)
    }
}
