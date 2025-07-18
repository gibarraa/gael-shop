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
    
    //variable que nos ayuda con el tamaño de la pantalla para poder definir mejor el tamaño de cada apartado
    var screen = NSScreen.main?.visibleFrame ?? .zero

    var body: some View {
        //Hstack principal donde va a estar todo el contenido, contiene el sidebar y el vstack del contenido principal, lleva un espaciado de 0 para que todo esté junto|
        HStack(spacing: 0) {
            SidebarView()//lamada de la estructura del sidebar
                .frame(width: screen.width / 6, height: screen.height)//uso de var screen para dar un ancho de una sexta parte al sidebar
            
            //vstack para el contenido principal, que será acomodado verticalmente, con espaciado de 0 igual para evitar blancos
            VStack(spacing: 0) {
                NavbarView()//llamada a la estructura del navbar
                ScrollView(.vertical, showsIndicators: false) {//scrollview que contiene todo el contenido principal
                    VStack(spacing: 20) {//vstack con espaciado de 20 para tener un poquito de espacio entre las 3 filas de contenido
                        CategoriesView()//llamada a la estructura categories
                        ProductView()//llamada a la estructura productos
                        HStack(alignment: .top, spacing: 20) {//hstack para poner en la misma fila discount y lastorder, con espaciuado de 20 y alineacion top
                            DiscountView()//llamada a la estructura descuento
                                .frame(maxWidth: .infinity, alignment: .leading)
                            LastOrderView()//llamada a la estructura last order
                                .padding(.trailing)
                        }
                        .padding(.horizontal)//padding horizontal para el hstack de la ultima fila
                    }
                    .padding(.vertical, 20)//padding vertical para el vstack del contenido principal
                }
                .background(Color.white)//background blanco para los espacios en blanco
                .frame(width: screen.width - (screen.width / 6), height: screen.height)// frame para el contenido principal con el ancho de la pantalla menos el ancho del sidebar para no hacerlo tan grande
            }
        }
        .background(Color.white)//background blanco para espacios vacíos
    }
}


//preview, ignorar
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
