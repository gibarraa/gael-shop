//
//  SidebarView.swift
//  gael-shop
//
//  Created by Ibarra on 16/07/25.
//

import SwiftUI

struct SidebarView: View {
    @State private var selected: String = "Dashboard"

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
        
            Spacer()
            VStack {
                Text("Gael ")
                    .font(.custom("HelveticaNeue-Bold", size: 24))
                    .foregroundColor(.green)
                + Text("Shop")
                    .font(.custom("HelveticaNeue-Bold", size: 24))
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity)
            
            Divider()
                .padding(.vertical, 2)

            SidebarButton(icon: "square.grid.2x2.fill", title: "Dashboard", selected: $selected)
            SidebarButton(icon: "circle.grid.3x3.fill", title: "Categories", selected: $selected)
            SidebarButton(icon: "heart.fill", title: "Favourite", selected: $selected)
            SidebarButton(icon: "cart.fill", title: "Orders", selected: $selected)
            SidebarButton(icon: "message.fill", title: "Messages", selected: $selected)
            SidebarButton(icon: "cube.fill", title: "Top Deals", selected: $selected)
            SidebarButton(icon: "gearshape.fill", title: "Settings", selected: $selected)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: 250, alignment: .leading)
        .background(Color.white)
    }
}

struct SidebarButton: View {
    let icon: String
    let title: String
    @Binding var selected: String

    var body: some View {
        Button(action: {
            selected = title
        }) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .frame(width: 24, height: 24)
                Text(title)
                    .font(.headline)
            }
            .foregroundColor(selected == title ? .white : .green.opacity(0.7))
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(selected == title ? Color.green : Color.clear)
            .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
