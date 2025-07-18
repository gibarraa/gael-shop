//
//  ProductView.swift
//  gael-shop
//
//  Created by Ibarra on 16/07/25.
//

import SwiftUI

struct ProductView: View {
   
    //arreglo donde guardo la información genérica de los productos, agregué más
    let products: [(name: String, description: String, price: Double, imageName: String)] = [
        ("Fresas", "Fresas frescas de la más alta calidad,", 20.10, "strawberry"),
        ("Lechuga", "Lechuga de granja natural", 15.10, "cabbage"),
        ("Brocolo", "brocoli de la más alta calidad para tu mesa", 25.10, "brocoly"),
        ("Naranja", "ricas naranjas francesas", 12.10, "orange"),
        ("Manzana Fresca", "Manzana de la cosecha del día", 18.10, "fresh_apple"),
        ("Plátano", "Plátano maduro orgánico", 10.50, "bananas"),
        ("Tomate", "Tomate rojo y jugoso", 8.90, "tomato"),
        ("Pimiento Verde", "Pimiento fresco para tus ensaladas", 14.00, "green_pepper"),
        ("Zanahoria", "Zanahoria crujiente y dulce", 7.20, "carrot"),
        ("Aguacate", "Aguacate hass maduro", 35.00, "avocado")
    ]

    var body: some View {
    
        VStack(alignment: .leading, spacing: 20) {//vstack que contiene toda la vista
            HStack {//Hstack que contiene el titulo y el botón de ver más
                Text("Productos Populares")//titulo
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer()//pone espacio entre el titulo y el botón para que estén en los 2 extremos
                
                Button(action: {
                    print("easter egg 2")//acción sin sentido, ignorar
                }) {
                    Text("Ver más")//texto del botón
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                .buttonStyle(PlainButtonStyle())//botón sin estilo para que se vea más minimalista
            }
            .padding(.horizontal)//padding horizontal del hstack

            ScrollView(.horizontal, showsIndicators: false) {// scrollview horizontal para poder poner todos los productos
                HStack(spacing: 20) {//hstack con espaciado 20 para tener espacio entre productos
                    ForEach(products, id: \.name) { product in
                        ProductCardView(product: product)//foreach que itera y pone los productos del array
                            .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                               view
                                                   // Rotación 3D alrededor del eje Y
                            .rotation3DEffect(
                            .degrees(phase.value * -30), // Gira de 0 a -90 grados
                                axis: (x: 0.0, y: 1.0, z: 0.0), // Alrededor del eje Y (vertical)
                                anchor: phase.value < 0 ? .trailing : .leading // Gira desde el borde cercano
                            )
                            // Desvanecimiento basado en la fase de scroll
                            .opacity(1.0 - abs(phase.value * 0.7)) // Opacidad: 1.0 (visible) a 0.3 (casi invisible)
                            .scaleEffect(1.0 - abs(phase.value * 0.1)) // Ligera reducción de escala
                                           }
                    }
                }
            }
            .padding(.horizontal)//padding horizontal para el hstack de productos
            
            Spacer()//espacio para después de los productos
        }
        .padding(.vertical)//padding de la estructura
        .background(Color.white)//fondo blanco como en todo el proyecto
    }
}

struct ProductCardView: View {//estructura para la card de cada producto
    let product: (name: String, description: String, price: Double, imageName: String)//define lo que tiene cada produxto y matchea con el array inicial

    var body: some View {
        //vstack para poner todo el contenido de la tarjeta
        VStack(alignment: .leading, spacing: 10) {
            ZStack(alignment: .topTrailing) {//zstack para la foto del producto y el botón de favoritos
                Image(product.imageName)//imagen del producto
                    .resizable()
                    .aspectRatio(contentMode: .fill)//se ajusta al contenedor
                    .frame(width: 150, height: 150)//relacion aspecto 1:1
                    .clipped()
                    .background(Color.white)
                    .cornerRadius(15)//bordes de la imagen
                
                Button(action: {//botón de favoritos
                    print("Agregando a favoritos: \(product.name)")//acción en terminal sin tanto funcionamiento
                }) {
                    Image(systemName: "heart.fill")//icono del corazón
                        .font(.caption)
                        .foregroundColor(.pink)//color rosa
                        .padding(5)//padding 5
                        .background(Color.white)//fondo blanco
                        .clipShape(Circle())//en forma circular
                        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)//con sombra
                }
                .buttonStyle(PlainButtonStyle())//sin bordes
                .offset(x: -10, y: 10)//puesto con offset para que no se vea en la mera esquina
            }
            
            Text(product.name)//nombre del producto con estilo
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(.black)
            
            Text(product.description)//descripción del producto con estilo
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(1)
            
            Spacer()//espaciador para poner el precio y el boton de agregar

            HStack {//hstack para el precio y para el boton de agregar
                Text("$\(product.price, specifier: "%.2f")")//precio
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                + Text("/kg")//señal de que está en kilos
                    .font(.caption2)
                    .foregroundColor(.gray)

                Spacer()//espaciador entre precio y boton
                
                Button(action: {
                    print("añadiendo al carrito \(product.name)")//boton sin funcionamiento real, manda señales a terminal
                }) {
                    Image(systemName: "plus")//simbolo de agregar para simular boton
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.green)
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())//estilo plano sin biordes que no queremos
            }
        }
        .padding(15)//padding del cardview
        .frame(width: 180, height: 280)//tamaño de cada card
        .background(Color.white)//fondo del card
        .cornerRadius(18)//bordes del card redondeados
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)//sombra para darle profundidad al proyecto
    }
}


//previewer, ignorar, solo sirvió durante el desarrollo
struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
