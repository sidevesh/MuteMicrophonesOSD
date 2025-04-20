// The Swift Programming Language
// https://docs.swift.org/swift-book

import AppKit
import BezelNotification

func after(_ delay: TimeInterval, perform block: @escaping ()->(), on queue: DispatchQueue = OperationQueue.current?.underlyingQueue ?? .main) { // So this `queue` preserves the current queue and defaulted to the `main`. Also the caller can pass in the desired queue explicitly
    queue.asyncAfter(deadline: .now() + delay, execute: block)
}

var showMuted: Bool = true

for argument in CommandLine.arguments {
    if (argument == "un-muted") {
        showMuted = false;
    }
}

let app = NSApplication.shared

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        var path: String?
        if (showMuted) {
            path = Bundle.module.path(forResource: "mic.slash.fill", ofType: "png")
        } else {
            path = Bundle.module.path(forResource: "mic.fill", ofType: "png")
        }
        let bezelIcon = NSImage(contentsOfFile: path!)
        
        let timeToLive = 1.0
        let fadeOutDuration = 1.0
        
        BezelNotification.show(
            messageText: "",
            icon: bezelIcon,
            timeToLive: .exactly(seconds: timeToLive),
            fadeInAnimationDuration: 0,
            fadeOutAnimationDuration: fadeOutDuration
        )
        
        after(timeToLive + fadeOutDuration) {
            app.terminate(self)
        }
    }
}

let delegate = AppDelegate()
app.delegate = delegate
app.run()
