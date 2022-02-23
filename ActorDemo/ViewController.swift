//
//  ViewController.swift
//  ActorDemo
//
//  Created by Ratti on 22/01/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let obj = PurchasePhone.init()
        let thread = DispatchQueue.init(label: "Purchase", attributes: .concurrent)
        
        //Race Condition
        /*
        thread.async {
            obj.purchaseItem(item: "iPhone 11")
        }
        
        thread.async {
            obj.showAvailableItem()
        }
         */
    //-----------------------------------------
        //Avoid Race Condition through Barrier Flag
        /*
        thread.async(flags: .barrier) {
            obj.purchaseItem(item: "iPhone 11")
        }
        
        thread.async {
            obj.showAvailableItem()
        }
         */
    //------------------------------------------------
        //Avoid Race Condition through Semaphore
        /*
        let semaphore = DispatchSemaphore.init(value: 1)
        thread.async {
            semaphore.wait()
            obj.purchaseItem(item: "iPhone 11")
            semaphore.signal()
        }
        
        thread.async {
            semaphore.wait()
            obj.showAvailableItem()
            semaphore.signal()
        }
         */
        
        //Avoid Race Condition through Actors
        let objActor = PurchasePhoneActor.init()
        thread.async {
            Task.detached{
               await objActor.purchaseItem(item: "iPhone 11")
            }
        }
        
        thread.async {
            Task.detached{
                await objActor.showAvailableItem()
            }
        }
    }

}

