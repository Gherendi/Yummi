//
//  ContentView.swift
//  Yummi
//
//  Created by Gherendi, Archie (EJNR) on 23/01/2024.
//

import SwiftUI

struct Ingredient {
    let name: String
    let category: String
    let Quantity: Int
    let Unit : Int
    let ExpiryDate: Date

    
    func Display() -> String {
        return ("Name: \(name) , Quantity: \(Quantity) , Category: \(category) , Unit: \(Unit) , ExpiryDate: \(ExpiryDate)")
    }
    
}


struct Recipe {
    let recipeName: String
    let recipeIngredients: String
    let recipeIsFavourite: Bool
    let recipeRating: Int

    
    
    #if DEBUG
    static func exampleRecipes() -> [Recipe] {
        [Recipe(recipeName: "Toad in the hole", recipeIngredients: "Egg, flour, milk, sausage", recipeIsFavourite: false, recipeRating: 75), Recipe(recipeName: "Mac and Cheese", recipeIngredients: "cheese, flour, milk, pasta", recipeIsFavourite: true, recipeRating: 95), Recipe(recipeName: "Sushi", recipeIngredients: "Fish, rice", recipeIsFavourite: false, recipeRating: 85)]
    }
    
    #endif
}





struct ContentView: View {
    @State private var newname = ""
    @State private var newcategory = ""
    @State private var newQuantity = 0
    @State private var newUnit = 0
    @State private var newExpiryDate = Date()
    
    @State private var Ingredients:  [Ingredient] = [Ingredient(name: "Carrot", category: "Vegetable", Quantity: 10, Unit: 2, ExpiryDate: Date())]
    

    
    
    
    var body: some View {
        Form{
            Section(header: Text("New Ingredient")) {
                TextField("name:", text: $newname)
                TextField("category:", text: $newcategory)
                Stepper(value: $newQuantity, in: 0...1000, label: {
                    Text("Quantity: \(newQuantity)")
                })
                Stepper(value: $newUnit, in: 1...1000, label: {
                    Text("Unit: \(newUnit)")
                })
                DatePicker("Expiry date:", selection: $newExpiryDate, displayedComponents: .date)            }
            Section {
                Button("Submit") {
                    let newingredient = Ingredient(name: newname, category: newcategory, Quantity: newQuantity, Unit: (newUnit), ExpiryDate: newExpiryDate)
                    Ingredients.append(newingredient)
                }
            }
        }
        VStack {
            ForEach(Ingredients, id: \.name) {
                Ingredient in Text(Ingredient.Display())
            }
            
        }
        .padding()
    }
}



struct RecipesView: View {
    
    @State private var Recipes: [Recipe] = Recipe.exampleRecipes()
    
    var body: some View {
        List {
            ForEach(Recipes, id:\.recipeName) { recipe in
                HStack {
                    VStack(alignment: .leading) {
                        Image(recipe.recipeName)
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(recipe.recipeName)
                            .font(.headline)
                        Text("Ingredients: \(recipe.recipeIngredients)")
                            .font(.subheadline)
                        Text("Rating: \(recipe.recipeRating)")
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    if recipe.recipeIsFavourite{
                        Text("✅")
                    } else {
                        Text("❌")
                    }
                }
            }
        }
    }
   

}












#Preview {
   // ContentView()
    RecipesView()
}


