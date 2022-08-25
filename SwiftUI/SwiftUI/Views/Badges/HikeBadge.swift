//
//  HikeBadge.swift
//  SwiftUIDemo
//
//  Created by 张建峰 on 2022/8/25.
//

import SwiftUI

struct HikeBadge: View {
    var name: String

    var body: some View {
        VStack(alignment: .center) {
            Badge()
               .frame(width: 300, height: 300)
               .scaleEffect(1.0 / 3.0)
               .frame(width: 100, height: 100)
            Text(name)
               .font(.caption)
               .accessibilityLabel("Badge for \(name).")
        }
   }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
