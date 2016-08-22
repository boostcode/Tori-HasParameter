/**
 * Copyright boostco.de 2016
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation
import Kitura
import KituraNet
import SwiftyJSON

public class HasParameter: RouterMiddleware {
   
    private let params: [String]
    private let returnStatus: HTTPStatusCode
    
    public init(params: [String], returnStatus: HTTPStatusCode = .OK) {
        self.params = params
        self.returnStatus = returnStatus
    }
    
    public func handle(request: RouterRequest, response: RouterResponse, next: () -> Void) {

        // loop params
        for param in params {
            // check if exist
            guard let _ = request.parameters[param] else {
                try! response
                    .status(self.returnStatus)
                    .send(json: JSON([
                        "status": "error",
                        "message": "missing \(param) parameter in request"
                        ]))
                    .end()
                return
            }
        }
        
        next()

    }
}
