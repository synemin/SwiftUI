//
//  SwiftUIApp.swift
//  SwiftUI
//
//  Created by 韩震明 on 2022/8/23.
//

import SwiftUI
import UIKit
@main
struct SwiftUIAppWrapper {
    static func main() {
        if#available(iOS 14.0, *) {
            SwiftUIApp.main()
        }else{
            UIApplicationMain(
                CommandLine.argc,
                CommandLine.unsafeArgv,
                nil,
                NSStringFromClass(SceneDelegate.self))
        }
    }
}

@available(iOS 14.0, *)
struct SwiftUIApp: App {
    @StateObject private var modelData = ModelData()
    var body:some Scene{
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
