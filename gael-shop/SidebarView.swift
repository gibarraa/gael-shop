//
//  SidebarView.swift
//  gael-shop
//
//  Created by Ibarra on 16/07/25.
//

import SwiftUI

//estructura del sidebar
struct SidebarView: View {
    
    //variable para el cambio de color al tener a botón seleccionado, aunque no tenga funcion
    @State private var selected: String = "Dashboard"

    
    //body del sidebar
    var body: some View {
        
        //vstack para todo el contenido
        VStack(alignment: .leading, spacing: 20) {
        
            VStack {//vstack para el titulo
                Text("Gael ")//nombre de la tienda en un color
                    .font(.custom("HelveticaNeue-Bold", size: 24))
                    .foregroundColor(.green)
                + Text("Shop")//palabra shop en otro color, se ve mejor así
                    .font(.custom("HelveticaNeue-Bold", size: 24))
                    .foregroundColor(.black)
            }//frame con el máximo de ancho
            .frame(maxWidth: .infinity)
            
            Divider()//divider con padding para separar los botones del titulo
                .padding(.vertical, 2)

            //botones con sus respectivos nombres, iconos y con el boleano de selected para cambiar el color de los botones
            SidebarButton(icon: "square.grid.2x2.fill", title: "Dashboard", selected: $selected)
            SidebarButton(icon: "circle.grid.3x3.fill", title: "Categorias", selected: $selected)
            SidebarButton(icon: "heart.fill", title: "Favoritos", selected: $selected)
            SidebarButton(icon: "cart.fill", title: "Ordenes", selected: $selected)
            SidebarButton(icon: "message.fill", title: "Mensajes", selected: $selected)
            SidebarButton(icon: "cube.fill", title: "Top Deals", selected: $selected)
            SidebarButton(icon: "gearshape.fill", title: "Configuración", selected: $selected)
            
            Spacer()// spacer para separar las cosas del final de la pantalla
        }
        .padding()//padding
        .frame(maxWidth: 250, alignment: .leading)//tamaño del ancho del sidebar
        .background(Color.white)
    }
}


//estructura para cada botón y hacer el código más legibke
struct SidebarButton: View {
    let icon: String
    let title: String
    //el boleano de selected para el color verde al seleccionar
    @Binding var selected: String

    
    //body dek botón
    var body: some View {
        Button(action: {
            selected = title//accion para cambiar el botón a verde al seleccionarlo
        }) {
            HStack(spacing: 12) {//hstack para el contenido del botón
                Image(systemName: icon)//imagen del icono
                    .frame(width: 24, height: 24)//relacion aspecto 1:1
                Text(title)//titulo del botón
                    .font(.headline)//fuente de titulo
            }
            .foregroundColor(selected == title ? .white : .green.opacity(0.7))//color verde con opacidad al estar activado el selected
            .padding()//padding
            .frame(maxWidth: .infinity, alignment: .leading)//tamaño y alineacion del botón
            .background(selected == title ? Color.green : Color.clear)//cambio a sin color al no estar seleccionado
            .cornerRadius(10)//bordes de 10
        }
        .buttonStyle(PlainButtonStyle())// botón de estilo plano
    }
}


//preview usado para el desarrollo, ignorar
struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
