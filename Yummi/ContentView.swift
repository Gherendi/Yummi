//
//  ContentView.swift
//  Yummi
//
//  Created by Gherendi, Archie (EJNR) on 23/01/2024.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationStack{
            Spacer()
            List {
                Section {
                    NavigationLink{
                        IngredientView()
                    } label: {
                        Text("Ingredients")
                    }
                    
                    NavigationLink{
                        RecipesView()
                    } label: {
                        Text("Recipes")
                    }
                    
                }
                            
                
                }
            }
    }
}









#Preview {
    ContentView()
}



