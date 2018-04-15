//
//  CustomViewController.swift
//  inonetask
//
//  Created by Lakshay Chhabra on 15/04/18.
//  Copyright © 2018 Lakshay Chhabra. All rights reserved.
//

import UIKit
import Foundation

class CustomViewController: UITabBarController {
    var tabBarList = [UIViewController]()
    var jsonObject: [String : Int] = ["noOfTabs" : 3]
    var count = 0
     let sampleTextField =  UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
     var tabsNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        sampleTextField.placeholder = "Enter number of tabs you want"
        sampleTextField.font = UIFont.systemFont(ofSize: 15)
        sampleTextField.borderStyle = UITextBorderStyle.roundedRect
        sampleTextField.keyboardType = UIKeyboardType.numberPad
        sampleTextField.returnKeyType = UIReturnKeyType.done
        sampleTextField.clearButtonMode = UITextFieldViewMode.whileEditing;
        sampleTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        sampleTextField.delegate = self as? UITextFieldDelegate
        self.view.addSubview(sampleTextField)
        
        
        //Button
        let button = UIButton()
        button.frame = CGRect(x: 40, y: 160, width:150, height: 50)
        button.backgroundColor = UIColor.blue
        button.setTitle("Add more Tabs", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
        
        navigationItem.title = "Task"
        
        
        
        
        let firstViewController = FirstVCViewController()
        
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        
        let secondViewController = secondVC()
        
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        
        let thirdViewController = thirdVC()
        
        thirdViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)
        
         tabBarList = [firstViewController, secondViewController, thirdViewController]
      
        
        viewControllers = tabBarList

    }

    @objc func buttonAction(sender: UIButton!) {
        
        
        print("Button tapped")
    
        tabsNumber = Int(sampleTextField.text!)!
        sampleTextField.text = ""
        print(tabsNumber)
        
        if tabsNumber < 3 {
        while count < tabsNumber {
        let thirdViewController = thirdVC()
        
        thirdViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)
        tabBarList.append(thirdViewController)
      
      setViewControllers(tabBarList, animated: true)
            count += 1
        }
            jsonObject["noOfTabs"] = jsonObject["noOfTabs"]! + tabsNumber
            
            tabsNumber = 0
        }
        else{
            print("Limit exceeds")

        }
        
    
    }
    


    

    

}
