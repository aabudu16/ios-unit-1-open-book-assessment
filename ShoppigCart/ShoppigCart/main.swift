//
//  main.swift
//  ShoppigCart
//
//  Created by Mr Wonderful on 7/25/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import Foundation


var startShopping = true
var finalPrice = 0.00
var savings = 0.0
var cart = [String:Int]()
var counter = 0


func getIntFromUser() -> String {
    print("Enter the item you want to add to your cart: ", terminator: "")
    while true {
        let input = readLine()
        if let input = input{
//            let userNum = Int(input) {
            return input.lowercased()
      }
    }
}

struct Item {
    
    let apple = 1.99
    let banana =  1.31
    let broccoli =  3.60
    let dogFood = 12.55
    let eggs = 5.69
    
    func amountOfApples(){
        print("you have added [🍎 APPLE] to you cart and you currently have [\(cart["🍎 apple"] ?? 0)] apples in your cart")
    }
    func amountOfBanana(){
          print("you have added [🍌 BANANA] to you cart and you currently have [\(cart["🍌 banana"] ?? 0)] bananas in your cart")
    }
    func amountOfbroccoli(){
         print("you have added [🥦 BROCCOLI] to you cart and you currently have [\(cart["🥦 broccoli"] ?? 0)] broccoli in your cart")
    }
    func amountOfDogFood(){
        print("you have added [🦴 DOG FOOD] to you cart and you currently have [\(cart["🦴 dogFood"] ?? 0)] dog food in your cart")
    }
    func amountOfeggs(){
        print("you have added [🥚 EGGS] to you cart and you currently have [\(cart["🥚 eggs"] ?? 0)] eggs in your cart")
    }
    func cashPayment(){
         print("You save 4% by using Cash. Your final price is $\(String(format: "%.2f", finalPrice)) you saved $\(String(format: "%.2f", savings))")
    }
    func debitOrCredit() {
        print("Unfortunatly no discount at this time. your final total price is $\(String(format: "%.2f", finalPrice))")
    }
    func myTotal(){
        print("Your total is $\(String(format: "%.2f",finalPrice)). Keep shopping or pick your payment method")
    }

}


enum PaymentType: Int {
    case debit 
    case credit
    
    func payment(){
        switch self{
        case .debit:
            print("You save 4% by using this method and will be added to your checkout")
            finalPrice += finalPrice * 0.004
        case .credit:
            print("There are no saving for using this method of payment")
        }
    }
    
}
func firstView(){
print("""



Thank you for coming in today to shop. Friendly reminder that at the end of your shopping,
 if you choose to pay with CASH, you will recieve a 4% discount on your final purchase.

press "9" for CASH
press "8" for DEDIT or CREDIT

                ********************************
                *                              *
                *       PURSUIT - MART         *
                *                              *
                ********************************

please pick from the items available to shop or press -1 to exit

 1) 🍎 APPLE priced at $1.99 each
 2) 🍌 BANANA priced at $1.31 each
 3) 🥦 BROCCOLI priced at $3.60 each
 4) 🦴 DOG FOOD priced at $12.55 each
 5) 🥚 EGGS priced at $5.69 each

""")
}
firstView()

func shoppingCart(){
    
    let userInput = getIntFromUser()
    
    if userInput == "-1" || userInput == "leave"{
        print("Sorry to see you go, but your total price before you leave is $\(String(format: "%.2f", finalPrice))")
        startShopping = false
    }else{
        
        switch userInput{
        case "1","apple":
            finalPrice += Item.init().apple
            cart["🍎 apple"] = (cart["🍎 apple"] ?? 0) + 1
           //print("you have added [🍎 APPLE] to you cart and you current total is $\(String(format: "%.2f", finalPrice))")
            Item.init().amountOfApples()
        case "2","banana":
            finalPrice += Item.init().banana
            cart["🍌 banana"] = (cart["🍌 banana"] ?? 0) + 1
            //print("you have added [🍌 BANANA] to you cart and you current total is $\(String(format: "%.2f", finalPrice))")
            Item.init().amountOfBanana()
        case "3","broccoli":
            finalPrice += Item.init().broccoli
            cart["🥦 broccoli"] = (cart["🥦 broccoli"] ?? 0) + 1
           //print("you have added [🥦 BROCCOLI] to you cart and you current total is $\(String(format: "%.2f", finalPrice))")
            Item.init().amountOfbroccoli()
        case "4","dog food":
            finalPrice += Item.init().dogFood
            cart["🦴 dogFood"] = (cart["🦴 dogFood"] ?? 0) + 1
            //print("you have added [🦴 DOG FOOD] to you cart and you current total is $\(String(format: "%.2f", finalPrice))")
           Item.init().amountOfDogFood()
        case "5","eggs":
            finalPrice += Item.init().eggs
            cart["🥚 eggs"] = (cart["🥚 eggs"] ?? 0) + 1
           // print("you have added [🥚 EGGS] to you cart and you current total is $\(String(format: "%.2f", finalPrice))")
            Item.init().amountOfeggs()
        case "9","cash":
            savings = finalPrice * 0.04
            finalPrice = finalPrice - savings
            Item.init().cashPayment()
            startShopping = false
            
        case "8","credit","debit":
           Item.init().debitOrCredit()
            startShopping = false
        case "show cart":
            print(cart)
        case "0","my total":
           Item.init().myTotal()
        default:
            print("Please enter a valid number to pick from the items available")
            
        }
    }
}

func executeStartShopping() {
    while startShopping {
        shoppingCart()
    }
}
executeStartShopping()

