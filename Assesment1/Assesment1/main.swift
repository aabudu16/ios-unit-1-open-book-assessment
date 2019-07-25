//
//  main.swift
//  Assesment1
//
//  Created by albert coelho oliveira on 7/25/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import Foundation

struct Cart {
    var items = [Item]()
}
struct Item {
    var name = String()
    var price = Double()
}
func getIntFromUser(total: Int, start: Int) -> Int {
    print("Enter your number here: ", terminator: "")
    while true {
        let input = readLine()
        if let input = input,
            let userNum = Int(input) {
            if userNum >= start && userNum <= total{
                return userNum
            }else {print("Please input a valid number")}
        }
        print("Wrong input, Please a valid number")
    }
    
}

var foodNames = ["Apples","Bananas","Cantaloupe","Dog Food ","Eggs"]
var foodPrice = [1.99,1.31,3.60,12.55,5.69]
var itemInit = Item.init()
var cartInit = Cart.init()
var cashCredit = false
func addToCart (user: Int){
    itemInit.name = foodNames[user]
    itemInit.price = foodPrice[user]
    cartInit.items.append(itemInit)
    let design2 = String(repeating: "🛒", count: 20)
    print("\(design2)\nYour current cart:")
    
    for i in cartInit.items{
        print(i)
    }
     print(design2)
}
func checkout(){
    var total = 0.0
    for i in cartInit.items{total += i.price}
    if cashCredit {
    print("With a 4% cash discount, your total comes to $\(total - total * 0.04)")
    print("You saved \(total*0.04) 💵💵🎊 \nThank you for shopping at Pursuit Farms!")
    }
    else {print("The total will be $\(total)\nThank you for shopping at Pursuit Farms!")}}
    print("Welcome to pursuit Farms \nWill you be paying with cash or credit? \nPlease input 0 for cash and 1 for credit")
    let firstInput = getIntFromUser(total: 1, start: 0)
    if firstInput == 0 {cashCredit = true}
    while true {
        print("what would you like to purchase? Enter the number of the product or -1 to stop")
        let design = String(repeating: "-", count: 20)
        print("\(design)\n---ALL ITEMS---")
        for i in 0...4{
            print("\(i): \(foodNames[i]): $\(foodPrice[i])")
        }
         print(design)
        let secondInput = getIntFromUser(total: 4, start: -1)
        if secondInput == -1{
            break
        }
        addToCart(user: secondInput)
    }
    checkout()



