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

let url = "ws://ec2-52-26-83-61.us-west-2.compute.amazonaws.com:8000/ws"
let domain = "xs.damouse"

extension String {
    func cString() -> UnsafeMutablePointer<Int8> {
        let cs = (self as NSString).UTF8String
        return UnsafeMutablePointer(cs)
    }
}



// Interface object for interacting with goRiffle
class Gopher: NSObject {
    var subscriptions: [Int: (AnyObject) -> ()] = [:]

    
    func subscribe(domain: String, fn: (AnyObject) -> ()) {
        let i = NSNumber(int: Subscribe(domain.cString())).integerValue
        subscriptions[i] = fn
    }
    
    func receive() {
        while true {
            let a = NSNumber(int: Recieve()).integerValue
            subscriptions[a]!("Hello!")
        }
    }
}


let ret = Connector(url.cString(), domain.cString());
print(String.fromCString(ret))

//Subscribe("xs.damouse.go/sub".goString())

let g = Gopher()
g.subscribe("xs.damouse.go/sub") { (obj: AnyObject) -> () in
    print("Subscription received!")
}

// Threading implementation
let thread = NSThread(target: g, selector: "receive", object: nil)
thread.start()
NSRunLoop.currentRunLoop().run()

