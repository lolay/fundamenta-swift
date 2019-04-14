//
//  Copyright © 2019 Lolay, Inc.
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

class DispatchQueueTests: XCTestCase {
    func testQueueForName() {
        let queue1 = DispatchQueue.queueForName("test1", concurrent: false, random: false)
        let name1 = queue1.label.split(separator: ".").last
        XCTAssertNotNil(name1)
        XCTAssertEqual(name1, "test1")
        
        let queue2 = DispatchQueue.queueForName("test2", concurrent: false, random: true)
        XCTAssert(queue2.label.contains(".test2."))
    }
    
    func testQueueForType() {
        let queue1 = DispatchQueue.queueForType(DispatchQueueTests.self, concurrent: false, random: false)
        let name1 = queue1.label.split(separator: ".").last
        XCTAssertNotNil(name1)
        XCTAssertEqual(name1, "DispatchQueueTests")
        
        let queue2 = DispatchQueue.queueForType(DispatchQueueTests.self, concurrent: false, random: true)
        XCTAssert(queue2.label.contains(".DispatchQueueTests."))
    }
}
