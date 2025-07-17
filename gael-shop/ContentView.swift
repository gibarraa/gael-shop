//
//  ContentView.swift
//  gael-shop
//
//  Created by Ibarra on 16/07/25.
//

import SwiftUI

struct ContentView: View {
    var screen = NSScreen.main!.visibleFrame
    var body: some View {
        HStack(spacing: 0) {
            SidebarView()
                .frame(width: screen.width / 6, height: screen.height)
            
            VStack(spacing: 0) {
                NavbarView()
                CategoriesView()
                ProductView()
            }
            .frame(width: screen.width - (screen.width / 5), height: screen.height)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
