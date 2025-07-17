//
//  DiscountView.swift
//  gael-shop
//
//  Created by Ibarra on 16/07/25.
//

import SwiftUI

struct DiscountView: View {
    struct DiscountBanner: Identifiable {
        let id = UUID()
        let percentage: Int
        let description: String
        let imageName: String
    }

    let discountBanners: [DiscountBanner] = [
        .init(percentage: 35, description: "Descuento elegible para productos de linea blanca, solo hasta el Jueves", imageName: "discount_bg_1"),
        .init(percentage: 20, description: "Ordena más de 2 kilos de carnes rojas y llevate este descuento", imageName: "discount_bg_2"),
        .init(percentage: 20, description: "Descuentos en todos los electrodomesticos durante este fin de semana", imageName: "discount_bg_3"),
        .init(percentage: 10, description: "Consigue este descuento siguiendonos en nuestra página de instagram", imageName: "discount_bg_4")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Descuentos")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)

                Spacer()

                Button(action: {
                    print("ya no hay más hahah")
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
                    ForEach(discountBanners) { banner in
                        DiscountBannerView(banner: banner)
                            .frame(width: 180)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct DiscountBannerView: View {
    let banner: DiscountView.DiscountBanner

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(banner.percentage)% de Descuento")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text(banner.description)
                .font(.caption)
                .foregroundColor(.white.opacity(0.8))
                .lineLimit(2)
            
            Spacer()
            
            Button(action: {
                print("Compra ahora con \(banner.percentage)% de descuento")
            }) {
                Text("Compra ahora")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 15)
                    .background(Color.white)
                    .cornerRadius(8)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(15)
        .frame(height: 200)
        .background(
            Image(banner.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .opacity(0.2)
        )
        .background(Color.green.opacity(0.7)) 
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
    }
}

struct DiscountView_Previews: PreviewProvider {
    static var previews: some View {
        DiscountView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
