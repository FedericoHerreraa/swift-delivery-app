//
//  FoodCard.swift
//  AppComidas
//
//  Created by Federico Herrera on 15/06/2025.
//

import SwiftUI

struct FoodCardView: View {
    @EnvironmentObject private var cart: Cart
    let food: Food
    
    var body: some View {
        VStack {
            Image(food.img)
                .resizable()
                .scaledToFit()
                .frame(height: 90)
                .foregroundColor(.orange)
            
            Text(food.title)
                .font(.title3)
                .bold()
                .foregroundColor(.black)
            
            Text(food.description)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
            
            HStack {
                Text("$\(String(food.price))")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)
                
                Spacer()
                
                Button {
                    cart.add(food)
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding(7)
                        .background(.green.opacity(0.7))
                        .cornerRadius(10)
                }
                
            }
            .padding(.horizontal, 10)
            
        }
        .padding(20)
        .frame(width: 200, height: 250)
        .background(.gray.opacity(0.03))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
    }
}

#Preview {
    FoodCardView(food: Food(
        title: "Pizza",
        description: "Deliciosa pizza napolitana",
        price: 3.57,
        img: "apple",
        nutrition: NutritionInfo(calories: 850, protein: 22, carbs: 90, fat: 35),
        extras: [
            ExtraOption(name: "Extra queso", price: 0.5),
            ExtraOption(name: "Aceitunas", price: 0.3)
        ]
    ))
}
