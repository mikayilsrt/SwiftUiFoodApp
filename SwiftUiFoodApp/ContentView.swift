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
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
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
                        HStack(spacing: 25) {
                            Spacer()
                            VStack(alignment: .leading, spacing: 7) {
                                Text("Chicken Salad")
                                    .font(.system(size: 24))
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
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(products) { product in
                                ProductCard(title: product.title, subTitle: product.subTitle, price: product.price)
                            }
                        }.padding()
                    }
                }
            }
            
            BottomNavigation()
                .padding(.bottom, 24)
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

struct BottomNavigation: View {
    var body: some View {
        HStack {
            Spacer()
            Button(action: {}) {
                Image("home_outline")
            }
            Spacer()
            Button(action: {}) {
                Image("folder_outline")
            }
            Spacer()
            Button(action: {}) {
                Image("message_circle_outline")
            }
            Spacer()
            Button(action: {}) {
                Image("person_outline")
            }
            Spacer()
        }
        .padding(.vertical, 20)
        .background(Color(.black))
        .cornerRadius(30)
        .padding(.horizontal, 13)
    }
}

struct ProductCard: View {
    
    private var title: String
    private var subTitle: String
    private var price: Float
    
    init(title: String, subTitle: String, price: Float) {
        self.title = title
        self.subTitle = subTitle
        self.price = price
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .center, spacing: 3) {
                Spacer()
                Text(self.title)
                    .fontWeight(.bold)
                Text(self.subTitle)
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                Text("$ \(String(self.price))")
                    .fontWeight(.bold)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 15)
            .padding(.bottom, 30)
            .background(Color("Color"))
            .cornerRadius(150)
            .frame(height: 240)
            
            
            Button(action: {}) {
                Image("plus_outline")
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .background(Color(.black))
                    .cornerRadius(45)
            }.padding(.top, 210)
            
            Image("food_image_2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding(.top, -25)
        }
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

struct Product: Identifiable {
    var id = UUID()
    var title: String
    var subTitle: String
    var price: Float
}

var categories: [Category] = [
    Category(title: "Salads"),
    Category(title: "Soups"),
    Category(title: "Grilled")
]

var products: [Product] = [
    Product(title: "Mixed Salad", subTitle: "Mix Vegetables", price: 24),
    Product(title: "Mixed Salad", subTitle: "Mix Vegetables", price: 24),
    Product(title: "Mixed Salad", subTitle: "Mix Vegetables", price: 24),
    Product(title: "Mixed Salad", subTitle: "Mix Vegetables", price: 24),
    Product(title: "Mixed Salad", subTitle: "Mix Vegetables", price: 24)
]
