//
//  NavbarView.swift
//  gael-shop
//
//  Created by Ibarra on 16/07/25.
//

import SwiftUI

struct NavbarView: View {
    //variable para el searchbar
    @State private var searchText: String = ""

    var body: some View {
        HStack(spacing: 20) {//hstack para el contenido principal del navbar
           
            HStack {//hstack para el searchbar
                Image(systemName: "magnifyingglass")//icono de lupa para el searchbar
                    .foregroundColor(.gray)//color gris
                
            
                TextField("", text: $searchText, prompt: Text("Busca tu artículo favorito").foregroundColor(.gray))//textfield para escribir con placeholder que manda el texto a la variable del searchbar
                    .textFieldStyle(PlainTextFieldStyle())//formato plano para el textfield
            }
            .padding(.vertical, 8)//padding vertical de 8
            .padding(.horizontal, 12)//padding horizontal del 12
            .cornerRadius(8)//bordes redondeados de 8
            .overlay(
                RoundedRectangle(cornerRadius: 8)//borde redondeado para el searchbar
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)//borde gris con opacidad para que se vea más minimalista
            )
            .frame(maxWidth: .infinity)//frame del searchbar

            
            HStack(spacing: 25) {//hstack con spacing del 25 para poner los botones y la foto de perfil
                Button(action: {// botón del calendario sin accion
                }) {
                    Image(systemName: "calendar")//icono de calendario
                        .font(.title2)
                        .foregroundColor(.green.opacity(0.7))//color verde con opacidad
                }
                .buttonStyle(PlainButtonStyle())//estilo de botón plano

                Button(action: {//botón para el correo sin funcion
                  
                }) {
                    Image(systemName: "envelope")//icono del correo
                        .font(.title2)
                        .foregroundColor(.green.opacity(0.7))// color verde con opacidad
                }
                .buttonStyle(PlainButtonStyle())//botón con estilo plano

               
                Button(action: {//botón sin acción para las notificaciones
                    
                }) {
                    Image(systemName: "bell") //icono de campana para las notificaciones
                        .font(.title2)
                        .foregroundColor(.green.opacity(0.7))// color verde con opacidad
                }
                .buttonStyle(PlainButtonStyle())//botón con estilo plano

                
                Divider()// divider para dividir los botones de la foto de perfil
                    .frame(height: 25)// altura de 25
                    .background(Color.gray.opacity(0.5))// color gris con opacidad al 59%

               
                Button(action: {//Botón para la foto de perfil
                    
                }) {
                    HStack(spacing: 5) {//hstack para la foto de perfil y la flecha de despliegue
                        Image(systemName: "person.circle.fill")// simulacion de la foto de perfil
                            .font(.system(size: 32))
                            .foregroundColor(.green.opacity(0.8))
                        
                        Image(systemName: "chevron.down")//botón de despliegue
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .buttonStyle(PlainButtonStyle())// estilo de botón plano
            }
        }
        .padding(.horizontal)//padding horizontal
        .padding(.vertical, 10)//padding vertical de 10
        .background(Color.white)//fondo blanco como en todo el proyecto
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)//sombra
    }
}


//preview usado para el desarrollo, ignorar
struct NavbarView_Previews: PreviewProvider {
    static var previews: some View {
        NavbarView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
