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

import Foundation

public extension DispatchQueue {
    /**
     Creates a serial utility queue prefixed by the `bundleIdentifier` with a random suffix if specified.
     - parameter subname: subname of the queue to create named like `bundleIdentifier`.`subname`.`random`
     - parameter
    */
    class func queueForName(_ subname: String, concurrent: Bool = false, random: Bool = false) -> DispatchQueue {
        let prefix: String = {
            if let bundleIdentifier = Bundle.main.bundleIdentifier {
                return bundleIdentifier + "."
            }
            return ""
        }()
        
        let suffix: String = {
            if random {
                return "." + String.randomString(length: 5)
            }
            return ""
        }()
        
        let label = prefix + subname + suffix
        
        let attributes: DispatchQueue.Attributes = {
            if concurrent {
                return DispatchQueue.Attributes.concurrent
            }
            return []
        }()
        
        return DispatchQueue(label: label, qos: .utility, attributes: attributes, autoreleaseFrequency: .workItem, target: DispatchQueue.global())
    }
    
    class func queueForType<T>(_ type: T.Type, concurrent: Bool = false, random: Bool = false) -> DispatchQueue {
        return DispatchQueue.queueForName(String(describing: type), concurrent: concurrent, random: random)
    }
}
