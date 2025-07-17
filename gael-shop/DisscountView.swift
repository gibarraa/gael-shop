//
//  DiscountView.swift
//  gael-shop
//
//  Created by Ibarra on 16/07/25.
//

import SwiftUI

struct DiscountView: View {
    //estructura con la informacion de los banner
    struct DiscountBanner: Identifiable {
        let id = UUID()
        let percentage: Int
        let description: String
        let imageName: String
    }

    //se crea un array para guardar los datos de cada banner que haremos, pueden agregarse más
    let discountBanners: [DiscountBanner] = [
        .init(percentage: 35, description: "Descuento elegible para productos de linea blanca, solo hasta el Jueves", imageName: "discount_bg_1"),
        .init(percentage: 20, description: "Ordena más de 2 kilos de carnes rojas y llevate este descuento", imageName: "discount_bg_2"),
        .init(percentage: 20, description: "Descuentos en todos los electrodomesticos durante este fin de semana", imageName: "discount_bg_3"),
        .init(percentage: 10, description: "Consigue este descuento siguiendonos en nuestra página de instagram", imageName: "discount_bg_4")
    ]

    var body: some View {//body de la estructura
        VStack(alignment: .leading, spacing: 20) {//vstack para poner todo el contenido
            HStack {//hstack para el titulo y para el botón ver más
                Text("Descuentos")//titulo con formato
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)

                Spacer()//espaciador para poner el titulo y botón en ambos estremos

                Button(action: {//botón sin funcionalidad
                    print("ya no hay más hahah")
                }) {
                    Text("Ver más")//texto de ver más para simular botón
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                .buttonStyle(PlainButtonStyle())//botón sin estilo
            }
            .padding(.horizontal)//padding horizontal para que no pegue en los bordes

            ScrollView(.horizontal, showsIndicators: false) {//scrollview para los banner de descuento
                HStack(spacing: 20) {
                    ForEach(discountBanners) { banner in
                        DiscountBannerView(banner: banner)//foreach para iterar todos los descuentos en el array
                            .frame(width: 180)
                    }
                }
                .padding(.horizontal)// padding de el carrusel de descuentos
            }
        }
    }
}

struct DiscountBannerView: View {
    let banner: DiscountView.DiscountBanner

    var body: some View {//body para cada banner de descuento
        VStack(alignment: .leading, spacing: 10) {//vstack para el contenido de el banner
            Text("\(banner.percentage)% de Descuento")//titulo que dice el descuento depende del array, con formato
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text(banner.description)//texto con la descripción del descuento y con formato
                .font(.caption)
                .foregroundColor(.white.opacity(0.8))
                .lineLimit(2)
            
            Spacer()//espaciador para poner el botón de compra
            
            Button(action: {//botón sin acción para compra
                print("Compra ahora con \(banner.percentage)% de descuento")//manda a terminal este texto
            }) {
                Text("Compra ahora")//texto del botón de compra
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 15)
                    .background(Color.white)
                    .cornerRadius(8)
            }
            .buttonStyle(PlainButtonStyle())//botón plano
        }
        .padding(15)//padding del banner
        .frame(height: 200)//altura del frame del banner
        .background(
            Image(banner.imageName)//imagen de background
                .resizable()
                .aspectRatio(contentMode: .fill)//pone la imagen al tamaño del banner
                .clipped()
                .opacity(0.2)//opacidad al 20% para que se vea transparente
        )
        .background(Color.green.opacity(0.8))//background verde encima de la imagen para que se vea como cristal
        .cornerRadius(15)//bordes redondeados
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)//sombra para profundidad
    }
}


//preview solo para desarrollo, ignorar
struct DiscountView_Previews: PreviewProvider {
    static var previews: some View {
        DiscountView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
