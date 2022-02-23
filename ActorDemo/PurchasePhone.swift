//
//  PurchasePhone.swift
//  ActorDemo
//
//  Created by Ratti on 22/01/22.
//

import Foundation

class PurchasePhone{
    private var arrPhonesAvailable: Array<String> = ["iPhone 13 Pro", "iPhone 13", "iPhone 12", "iPhone 11", "iPhone X"]
    
    func showAvailableItem(){
        print("Available phones to buy are \(arrPhonesAvailable)")
    }
    
    func purchaseItem(item: String){
        if let index = self.arrPhonesAvailable.firstIndex(of: item){
            print("\(item) purchased successfully..!!!")
            self.arrPhonesAvailable.remove(at: index)
        }
        else{
            print("Item not available")
        }
    }
}

//Actor
actor PurchasePhoneActor{
    private var arrPhonesAvailable: Array<String> = ["iPhone 13 Pro", "iPhone 13", "iPhone 12", "iPhone 11", "iPhone X"]
    
    func showAvailableItem(){
        print("Available phones to buy are \(arrPhonesAvailable)")
    }
    
    func purchaseItem(item: String){
        if let index = self.arrPhonesAvailable.firstIndex(of: item){
            print("\(item) purchased successfully..!!!")
            self.arrPhonesAvailable.remove(at: index)
        }
        else{
            print("Item not available")
        }
    }
}
