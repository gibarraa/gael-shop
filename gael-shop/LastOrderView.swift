//
//  LastOrderView.swift
//  gael-shop
//
//  Created by Ibarra on 16/07/25.
//

import SwiftUI

//struct para los datos de los pedidos
struct LastOrderView: View {
    struct LastOrderItem: Identifiable {
        let id = UUID()
        let name: String
        let weight: String
        let price: Double
        let imageName: String
    }

    //array con los datos de los ultimos pedidos
    let lastOrders: [LastOrderItem] = [
        .init(name: "Azafrán", weight: "500 gm", price: 150.00, imageName: "red_saffron"),
        .init(name: "Manzana fresca", weight: "2 kg", price: 120.00, imageName: "fresh_apple"),
        .init(name: "Pezcado", weight: "6 Kg", price: 300.00, imageName: "big_fish")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {//vstack  para todo el contenido
            Text("Ultimo Pedido")//texto del titulo con su formato
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.horizontal)

            VStack(spacing: 10) {//vstack para poner los ultimos pedidops
                ForEach(lastOrders) { order in
                    LastOrderItemView(item: order)//foreach que itera el array de ultimos pedidos
                }
            }
            .padding(.horizontal)
            
            Spacer()//spacer para el separar del final de la pantalla
        }
        .frame(width: 300, alignment: .topLeading)
        .cornerRadius(15)
    }
}

struct LastOrderItemView: View {//estructura de cada item
    let item: LastOrderView.LastOrderItem

    var body: some View {
        HStack(spacing: 10) {//hstack para meter todo el contenido principal
            Image(item.imageName)//imagen del producto
                .resizable()
                .aspectRatio(contentMode: .fill)//llena todo el espacio
                .frame(width: 50, height: 50)//relación aspecto 1:1
                .clipped()
                .cornerRadius(10)//bordes redondeados

            VStack(alignment: .leading, spacing: 2) {//vstack para el nombre y el peso
                Text(item.name)//nombre del articulo con formato
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                Text("Peso: \(item.weight)")//peso con formato
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            
            Spacer()//spacer para separar la información del precio y la cantidad

            Text("$\(item.price, specifier: "%.2f")")//precio con formato
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.green)
            
            HStack(spacing: 0) {
                Button(action: { print("menos \(item.name)") }) {//botón para restar producto
                    Image(systemName: "minus.circle.fill")
                        .font(.caption)
                        .foregroundColor(.green)
                }
                .buttonStyle(PlainButtonStyle())//botón sin estilo

                Text("1")//Cantidad con estilo
                    .font(.caption2)
                    .padding(.horizontal, 4)

                Button(action: { print("más \(item.name)") }) {//botón sin acción para agregar más
                    Image(systemName: "plus.circle.fill")
                        .font(.caption)
                        .foregroundColor(.green)
                }
                .buttonStyle(PlainButtonStyle())// botópn plano sin estilo
            }
        }
        .padding(.vertical, 8)//padding vertical
    }
}


//preview para el desarrollo, ignorar
struct LastOrderView_Previews: PreviewProvider {
    static var previews: some View {
        LastOrderView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
