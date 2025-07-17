//
//  ProductView.swift
//  gael-shop
//
//  Created by Ibarra on 16/07/25.
//

import SwiftUI

struct ProductView: View {
   
    let products: [(name: String, description: String, price: Double, imageName: String)] = [
        ("Fresas", "Fresas frescas de la más alta calidad,", 20.10, "strawberry"),
        ("Lechuga", "Lechuga de granja natural", 15.10, "cabbage"),
        ("Brocolo", "brocoli de la más alta calidad para tu mesa", 25.10, "brocoly"),
        ("Naranja", "ricas naranjas francesas", 12.10, "orange"),
        ("Manzana Fresca", "Manzana de la cosecha del día", 18.10, "fresh_apple")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Productos Populares")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer()
                
                Button(action: {
                    print("easter egg 2")
                }) {
                    Text("Ver más")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(products, id: \.name) { product in
                        ProductCardView(product: product)
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding(.vertical)
        .background(Color.white)
    }
}

struct ProductCardView: View {
    let product: (name: String, description: String, price: Double, imageName: String)

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack(alignment: .topTrailing) {
                Image(product.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped() 
                    .background(Color.white)
                    .cornerRadius(15)
                
                Button(action: {
                    print("Agregando a favoritos: \(product.name)")
                }) {
                    Image(systemName: "heart.fill")
                        .font(.caption)
                        .foregroundColor(.pink)
                        .padding(5)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                }
                .buttonStyle(PlainButtonStyle())
                .offset(x: -10, y: 10)
            }
            
            Text(product.name)
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(.black)
            
            Text(product.description)
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(1)
            
            Spacer()

            HStack {
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                + Text("/kg")
                    .font(.caption2)
                    .foregroundColor(.gray)

                Spacer()
                
                Button(action: {
                    print("añadiendo al carrito \(product.name)")
                }) {
                    Image(systemName: "plus")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.green)
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(15)
        .frame(width: 180, height: 280)
        .background(Color.white)
        .cornerRadius(18)
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
