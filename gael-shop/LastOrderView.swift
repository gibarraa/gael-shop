//
//  LastOrderView.swift
//  gael-shop
//
//  Created by Ibarra on 16/07/25.
//

import SwiftUI

struct LastOrderView: View {
    struct LastOrderItem: Identifiable {
        let id = UUID()
        let name: String
        let weight: String
        let price: Double
        let imageName: String
    }

    let lastOrders: [LastOrderItem] = [
        .init(name: "Azafrán", weight: "500 gm", price: 150.00, imageName: "red_saffron"),
        .init(name: "Manzana fresca", weight: "2 kg", price: 120.00, imageName: "fresh_apple"),
        .init(name: "Pezcado", weight: "6 Kg", price: 300.00, imageName: "big_fish")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Ultimo Pedido")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.horizontal)

            VStack(spacing: 10) {
                ForEach(lastOrders) { order in
                    LastOrderItemView(item: order)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .frame(width: 300, alignment: .topLeading)
        .cornerRadius(15)
    }
}

struct LastOrderItemView: View {
    let item: LastOrderView.LastOrderItem

    var body: some View {
        HStack(spacing: 10) {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipped()
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 2) {
                Text(item.name)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                Text("Peso: \(item.weight)")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            
            Spacer()

            Text("$\(item.price, specifier: "%.2f")")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.green)
            
            HStack(spacing: 0) {
                Button(action: { print("menos \(item.name)") }) {
                    Image(systemName: "minus.circle.fill")
                        .font(.caption)
                        .foregroundColor(.green)
                }
                .buttonStyle(PlainButtonStyle())

                Text("1")
                    .font(.caption2)
                    .padding(.horizontal, 4)

                Button(action: { print("más \(item.name)") }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.caption)
                        .foregroundColor(.green)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.vertical, 8)
    }
}

struct LastOrderView_Previews: PreviewProvider {
    static var previews: some View {
        LastOrderView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
