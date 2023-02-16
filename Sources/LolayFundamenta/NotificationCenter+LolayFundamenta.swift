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
import Foundation

public extension NotificationCenter {
    /**
    Adds an observer with block for multiple notifications.
    - returns: Array of handles for removing observers.
    - parameters:
        - names: Notification names (divided by comma).
        - object: Specify object you only want to listen to.
        - block: Block to run when notification observed.
     - Important:
     The block is run synchronously on the given queue.
     To unregister observations, you pass the object returned by this method to removeObservers(_:).
    */
    func addObservers(forNames names: NSNotification.Name..., object obj: Any? = nil, queue: OperationQueue? = nil, using block: @escaping @Sendable (Notification) -> Void) -> [NSObjectProtocol] {
        var observers:[NSObjectProtocol] = []
        names.forEach {
            let observer = self.addObserver(forName: $0, object: obj, queue: queue, using: block)
            observers.append(observer)
        }
        return observers
    }
    
    func removeObservers(_ observers: [NSObjectProtocol]) {
        observers.forEach { self.removeObserver($0) }
    }
}
