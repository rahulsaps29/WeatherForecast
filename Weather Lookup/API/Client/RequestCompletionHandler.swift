//
//  RequestCompletionHandler.swift
//  Weather Lookup
//
//  Created by Rahul Singh on 13/03/22.
//

import Foundation


struct RegularRequestCompletion<Response> {
    let success: (Response) -> ()
    let failure: ((Error) -> ())?
    
    init(success: @escaping (Response) -> (), failure: ((Error) -> ())? = nil) {
        self.success = success
        self.failure = failure
    }
}

enum RequestCompletion<Response> {
    case regular(completion: RegularRequestCompletion<Response>)
    
    var failure: ((Error) -> ())? {
        switch self {
            case .regular(let completion): return completion.failure
        }
    }
}
