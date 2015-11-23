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

func convertJson(key: String? = nil) -> [String: AnyObject] {
    return [:]
}

// Interface object for interacting with goRiffle
class Gopher: NSObject {
    var subscriptions: [Int64: (AnyObject) -> ()] = [:]

    
    func subscribe(domain: String, fn: (AnyObject) -> ()) {
        let s = Subscribe(domain.cString())
        let d = NSData(bytes: s.data , length: NSNumber(longLong: s.len).integerValue)
        let data = try! NSJSONSerialization.JSONObjectWithData(d, options: .AllowFragments) as! NSDecimalNumber
        subscriptions[data.longLongValue] = fn
    }
    
    func receive() {
        while true {
            let s = Recieve()
            let d = NSData(bytes: s.data , length: NSNumber(longLong: s.len).integerValue)
            let data = try! NSJSONSerialization.JSONObjectWithData(d, options: .AllowFragments) as! [String: AnyObject]
            
            // How do we check what kind of message this is?
            subscriptions[Int64(data["id"] as! Double)]!(data["data"]!)
        }
    }
}


let ret = Connector(url.cString(), domain.cString());


let g = Gopher()
g.subscribe("xs.damouse.go/sub") { (obj: AnyObject) -> () in
    print("Subscription received: \(obj)")
}

// Threading implementation
let thread = NSThread(target: g, selector: "receive", object: nil)
thread.start()
NSRunLoop.currentRunLoop().run()

