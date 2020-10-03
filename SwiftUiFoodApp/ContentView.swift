//
//  ContentView.swift
//  SwiftUiFoodApp
//
//  Created by Mikayil SERT on 02/10/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

struct HomeView: View {
    
    @State private var categorySelected: UUID = categories[0].id
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HeaderView()
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Delicious Salads")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("We made fresh and Healthy food")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
            }.padding(.horizontal, 13)
            
            HStack(spacing: 0) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack() {
                        Spacer()
                        
                        ForEach(categories) { category in
                            Button(action: {
                                self.categorySelected = category.id
                            }) {
                                Text(category.title)
                                    .font(.system(size: 13))
                                    .padding(.horizontal, 17)
                                    .padding(.vertical, 9)
                                    .foregroundColor(
                                        category.id == categorySelected ? .white : .black
                                    )
                                    .background(category.id == categorySelected ? Color(.black) : Color("Color"))
                                    .cornerRadius(45)
                            }
                        }
                    }
                }
                
                Image("options_outline")
                    .padding(.horizontal)
            }
            
            ZStack(alignment: .leading) {
                HStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: 7) {
                        Text("Chicken Salad")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Chicken with Avocado")
                            .foregroundColor(.gray)
                        Text("$32.00")
                            .fontWeight(.bold)
                    }
                    
                    Button(action: {}) {
                        Image("plus_outline")
                            .padding()
                            .background(Color(.black))
                            .cornerRadius(45)
                    }
                }
                .padding()
                .padding(.vertical, 25)
                .background(Color("Color"))
                .cornerRadius(150)
                
                Image("food_image_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                    .padding(.leading, -130)
            }
            .padding(.horizontal, 13)
            
            Spacer()
        }
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Image("menu_outline")
            Spacer()
            Image("search_outline")
        }.padding(.horizontal, 13)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


class Category: Identifiable {
    var id = UUID()
    var title: String = ""
    
    init(title: String) {
        self.title = title
    }
}

var categories: [Category] = [
    Category(title: "Salads"),
    Category(title: "Soups"),
    Category(title: "Grilled")
]
