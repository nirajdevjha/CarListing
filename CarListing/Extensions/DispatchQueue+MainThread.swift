//
//  DispatchQueue+MainThread.swift
//  CarListing
//
//  Created by Niraj Kumar Jha on 13/10/21.
//

import Foundation

extension DispatchQueue {
    class func dispatchToMainThreadIfRequired(execute: @escaping () -> Void) {
        if Thread.isMainThread {
            execute()
        } else {
            DispatchQueue.main.async {
                execute()
            }
        }
    }
}
