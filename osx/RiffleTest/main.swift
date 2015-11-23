//
//  main.swift
//  RiffleTest
//
//  Created by Mickey Barboi on 11/22/15.
//  Copyright © 2015 exis. All rights reserved.
//

import Foundation

// Helper methods
//(str as NSString).UTF8String

extension String {
    func goString() -> UnsafeMutablePointer<Int8> {
        let cs = (self as NSString).UTF8String
        return UnsafeMutablePointer(cs)
    }
}

//print(Tester())

class Spinner: NSObject {
    func doThings() {
        while true {
            
        }
    }
}

let url = "ws://ec2-52-26-83-61.us-west-2.compute.amazonaws.com:8000/ws"
let domain = "xs.damouse"
let ret = Connector(url.goString(), domain.goString());
print(String.fromCString(ret))

Subscribe()

// Threading implementation
let s = Spinner()

// Means to let the library do its thing while we listen
let thread = NSThread(target: s, selector: "doThings", object: nil)

print("Preloop")
NSRunLoop.currentRunLoop().run()
print("Postloop")

