//
//  CategoriesView.swift
//  gael-shop
//
//  Created by Ibarra on 16/07/25.
//

import SwiftUI

struct CategoriesView: View {
    
    let categories: [(name: String, iconName: String)] = [
        ("Fruits", "fruits"),
        ("Bread", "bread"),
        ("Vegetable", "vegetables"),
        ("Fish", "fish"),
        ("Meat", "meat"),
        ("Drinks", "drinks"),
        ("Sea Food", "seafood"),
        ("Ice Cream", "icecream"),
        ("Juice", "juice"),
        ("Ham", "ham")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                Text("Categories")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer()
                
                Button(action: {
                    print("easter egg jaja")
                }) {
                    HStack(spacing: 5) {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.green)
                        Text("Filter")
                            .foregroundColor(.green)
                            .font(.headline)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 15)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.green, lineWidth: 1)
                    )
                }
                .buttonStyle(PlainButtonStyle())

                Button(action: {
                    print("no sirve, scrollea")
                }) {
                    Image(systemName: "chevron.left")
                        .font(.headline)
                        .foregroundColor(.green)
                        .padding(10)
                        .background(Color.green.opacity(0.1))
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())

              Button(action: {
                    print("no sirve, scrollea")
                }) {
                    Image(systemName: "chevron.right")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.green)
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(categories, id: \.name) { category in
                        CategoryItemView(name: category.name, iconName: category.iconName)
                            
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


struct CategoryItemView: View {
    let name: String
    let iconName: String

    var body: some View {
        VStack(spacing: 8) {
            
            Image(iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)

            Text(name)
                .font(.caption)
                .foregroundColor(.black.opacity(0.8))
        }
        .padding(10)
        .frame(width: 100) 
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
