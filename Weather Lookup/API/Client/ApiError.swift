//
//  ApiError.swift
//  Weather Lookup
//
//  Created by Rahul Singh on 13/03/22.
//

import Foundation

extension NSError {
    static func apiDomainError(_ json: [String: AnyObject]) -> NSError? {
        return nil
    }
    
    static func errorWithMessage(_ message: String) -> NSError {
        return NSError(domain: "AppDomain", code: 0, userInfo: [NSLocalizedDescriptionKey : message])
    }
}
