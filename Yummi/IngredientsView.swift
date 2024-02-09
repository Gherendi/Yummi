//
//  IngredientsView.swift
//  Yummi
//
//  Created by Gherendi, Archie (EJNR) on 08/02/2024.
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

struct IngredientView: View {
    @State private var newname = ""
    @State private var newcategory = ""
    @State private var newQuantity = 0
    @State private var newUnit = 0
    @State private var newExpiryDate = Date()
    
    @State private var ingredients:  [Ingredient] = [Ingredient(name: "Carrot", category: "Vegetable", Quantity: 10, Unit: 2, ExpiryDate: Date())]
    
    
    private func clearIngredient(){
        newname = ""
        newcategory = ""
        newQuantity = 0
        newUnit = 0
        newExpiryDate = Date()
    }
    
    private func delete(at offsets: IndexSet){
        ingredients.remove(atOffsets: offsets)
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
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
                            ingredients.append(newingredient)
                            clearIngredient()
                        }
                    }
                }
                List{
                    ForEach(ingredients, id: \.name) {
                        Ingredient in Text(Ingredient.Display())
                    }
                    .onDelete(perform: delete)
                }
                .navigationTitle("Ingredients")
            }
            .padding()
        }
    }
}
