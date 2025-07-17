//
//  ContentView.swift
//
//  ContentView.swift
//  gael-shop
//
//  Created by Ibarra on 16/07/25.
//

import SwiftUI

struct ContentView: View {
    var screen = NSScreen.main?.visibleFrame ?? .zero

    var body: some View {
        HStack(spacing: 0) {
            SidebarView()
                .frame(width: screen.width / 6, height: screen.height)
            VStack(spacing: 0) {
                NavbarView()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        CategoriesView()
                        ProductView()
                        HStack(alignment: .top, spacing: 20) {
                            DiscountView()
                                .frame(maxWidth: .infinity, alignment: .leading)
                            LastOrderView()
                                .padding(.trailing)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical, 20)
                }
                .background(Color.white)
                .frame(width: screen.width - (screen.width / 6), height: screen.height)
            }
        }
        .background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
