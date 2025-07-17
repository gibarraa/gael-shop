//
//  NavbarView.swift
//  gael-shop
//
//  Created by Ibarra on 16/07/25.
//

import SwiftUI

struct NavbarView: View {
    @State private var searchText: String = ""

    var body: some View {
        HStack(spacing: 20) {
           
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
            
                TextField("", text: $searchText, prompt: Text("Busca tu artículo favorito").foregroundColor(.gray))
                    .textFieldStyle(PlainTextFieldStyle())
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
            .frame(maxWidth: .infinity)

            
            HStack(spacing: 25) {
                Button(action: {
                }) {
                    Image(systemName: "calendar")
                        .font(.title2)
                        .foregroundColor(.green.opacity(0.7))
                }
                .buttonStyle(PlainButtonStyle())

                Button(action: {
                  
                }) {
                    Image(systemName: "envelope")
                        .font(.title2)
                        .foregroundColor(.green.opacity(0.7))
                }
                .buttonStyle(PlainButtonStyle())

               
                Button(action: {
                    
                }) {
                    Image(systemName: "bell")
                        .font(.title2)
                        .foregroundColor(.green.opacity(0.7))
                }
                .buttonStyle(PlainButtonStyle())

                
                Divider()
                    .frame(height: 25)
                    .background(Color.gray.opacity(0.5))

               
                Button(action: {
                    
                }) {
                    HStack(spacing: 5) {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(.green.opacity(0.8))
                        
                        Image(systemName: "chevron.down")
                            .font(.caption) 
                            .foregroundColor(.gray)
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
    }
}

struct NavbarView_Previews: PreviewProvider {
    static var previews: some View {
        NavbarView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
