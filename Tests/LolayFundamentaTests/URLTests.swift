//
//  Copyright © 2023 Lolay, Inc.
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

class URLTests: XCTestCase {
    func testQueryParameters() {
        XCTAssertNil(URL(string: "http://www.lolay.com")!.queryParameters)
        XCTAssertNil(URL(string: "http://www.lolay.com/foo")!.queryParameters)
        guard let params3 = URL(string: "http://www.lolay.com/foo?a=1&b=2")!.queryParameters else { XCTFail(); return }
        XCTAssertEqual(params3.count, 2)
        XCTAssertEqual(params3["a"], "1")
        XCTAssertEqual(params3["b"], "2")
        
        guard let params4 = URL(string: "http://www.lolay.com/foo?a")!.queryParameters else { XCTFail(); return }
        XCTAssertEqual(params4.count, 0)
    }
}
