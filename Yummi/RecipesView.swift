//
//  RecipesView.swift
//  Yummi
//
//  Created by Gherendi, Archie (EJNR) on 08/02/2024.
//

import SwiftUI

struct Recipe {
    let recipeName: String
    let recipeIngredients: String
    let recipeIsFavourite: Bool
    let recipeRating: Int
    let recipeServings: Int

    
    
    #if DEBUG
    static func exampleRecipes() -> [Recipe] {
        [Recipe(recipeName: "Toad in the hole", recipeIngredients: "Egg, flour, milk, sausage", recipeIsFavourite: false, recipeRating: 75, recipeServings: 4), Recipe(recipeName: "Mac and Cheese", recipeIngredients: "cheese, flour, milk, pasta", recipeIsFavourite: true, recipeRating: 95, recipeServings: 6), Recipe(recipeName: "Sushi", recipeIngredients: "Fish, rice", recipeIsFavourite: false, recipeRating: 85, recipeServings: 2)]
    }
    
    #endif
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
                        Text("Servings: \(recipe.recipeServings)")
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









