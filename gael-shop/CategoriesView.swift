//
//  CategoriesView.swift
//  gael-shop
//
//  Created by Ibarra on 16/07/25.
//

import SwiftUI


//estructura para las categorías
struct CategoriesView: View {
    let categories: [(name: String, iconName: String)] = [//array de categorías para poner el nombre y el nombre de la imagen
        ("Frutas", "fruits"),
        ("Panes", "bread"),
        ("Vegetales", "vegetables"),
        ("Pescadería", "fish"),
        ("Carne", "meat"),
        ("Bebidas", "drinks"),
        ("Sea Food", "seafood"),
        ("Helado", "icecream"),
        ("Jugos", "juice"),
        ("Jamón", "ham"),
        ("Lácteos", "dairy"),
        ("Snacks", "snacks"),
        ("Cereales", "cereal"),
        ("Postres", "desserts"),
        ("Congelados", "frozen"),
        ("Especias", "spices")
    ]

    //body de la estructura categories
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {//vstack con padding de 20 que contiene todo el contenido
            HStack {//Hsrack para el titulo, el botón de filtro y los botones de navegación
                Text("Categorías")//titulo
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer()//espaciador para separar el titulo de los botones
                
                Button(action: {//  botón sin funcionamiento para el filtrado de categorías
                    print("easter egg jaja")
                }) {
                    HStack(spacing: 5) {//hstack para la imagen de botón
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.green)
                       
                    }
                    .padding(.vertical, 8)//padding vertical de 8
                    .padding(.horizontal, 8)//padding horizontal de 8 oara hacerlo cuadrado
                    .background(Color.white)//fondo blanco
                    .cornerRadius(100)//corner radius para el botón
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)//hace el botón más cirular
                            .stroke(Color.green, lineWidth: 1)//hace los outlines
                    )
                }
                .buttonStyle(PlainButtonStyle())//boton con estilo plano

                Button(action: {//botón para scroll sin funcionamiento
                    print("no sirve, scrollea")
                }) {
                    Image(systemName: "chevron.left")//imagen de flecha izq con formato
                        .font(.headline)
                        .foregroundColor(.green)
                        .padding(10)
                        .background(Color.green.opacity(0.1))
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())

                Button(action: {
                    print("no sirve, scrollea")//botón para el scroll sin funcionamiento
                }) {
                    Image(systemName: "chevron.right")//imagen de flecha derecha con su formato
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.green)
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {//carrusel para las categorías
                HStack(spacing: 15) {//Espaciado de 15 entre cada categoría
                    ForEach(categories, id: \.name) { category in
                        CategoryItemView(name: category.name, iconName: category.iconName)//foreach que pone cada categoría dependiendo de lo que haya en el arreglo que hicimos al inicio
                    }
                }
            }
            .padding(.horizontal)// padding horizontal para evitar que estén juntos
            
            
        }
        .padding(.vertical)
        .background(Color.white)
    }
}

struct CategoryItemView: View {//estructura para cada item del carrusel
    let name: String
    let iconName: String

    var body: some View {
        VStack(spacing: 8) {//vstack con espaciado de 8 para separar nombre e imagen
            Image(iconName)//imagen de la categoría
                .resizable()
                .aspectRatio(contentMode: .fit)//se ajusta para que quede al tamaño
                .frame(width: 60, height: 60)//relacion aspecto 1:1
                .background(Color.white)//color blanco en el fondo
                .cornerRadius(15)//borde de la imagen redondeado
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)//sombra para darle produndidad

            Text(name)//nombre de la categoría con formato
                .font(.caption)
                .foregroundColor(.black.opacity(0.8))
        }
        .padding(10)//padding gral de 10
        .frame(width: 100)//ancho de cada categoría de 100
        .background(Color.white)//fondo blanco en cada categoría
        .cornerRadius(15)//bordes de categorías redondeados
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)//sombra para meterle profundidad
    }
}


//preview usado para desarrollo, ignorar
struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
