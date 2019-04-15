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

import Foundation
import os.log

public extension OSLog {
    /*
     Creates a log using the class type as the category and the bundle identifer as the subsystem
     - parameter type: The class type to use for the log. This will turn the type into a string.
     - parameter bundle: The bundle to use for the subsystem name
     */
    class func logForType<T>(_ type: T.Type, bundle: Bundle = Bundle.main) -> OSLog {
        let subsystem: String = {
            if let bundleIdentifier = bundle.bundleIdentifier {
                return bundleIdentifier
            }
            return bundle.bundlePath
        }()
        return OSLog.init(subsystem: subsystem, category: String(describing: type))
    }
}
