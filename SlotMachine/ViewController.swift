//
//  ViewController.swift
//  SlotMachine
//
//  Created by Marco F.A. Corzani on 04.10.14.
//  Copyright (c) 2014 Alphaweb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Containers
    
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    //Constants
    
    // Konstante für Abstand
    let kMarginForView:CGFloat = 10.0    // 10 Punkte
    let kSixth:CGFloat = 1/6            // En Sechstel
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
     setupContainerViews()
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // //Dispose of any resources that can be recreated.
    
    }

    //self. kann hier für view verwendet werden, weil im Storyboard der View existiert
    // Die Konstante wird zur Eingansposition von x addiert (in der linken, oberen Ecke) und von der Weite 2 x abgezogen. Die Höhe wird mit 1/6 multipliziert
    func setupContainerViews() {
        self.firstContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, self.view.bounds.origin.y, self.view.bounds.width - (kMarginForView * 2), self.view.bounds.height * kSixth))
        self.firstContainer.backgroundColor = UIColor.redColor()
        // Der eben erstellte firstContainer wird "view" als Subview hinzugefügt
        self.view.addSubview(self.firstContainer)
        
        // Der Y-Wert wird hier auf die Höhe des ersten Containers gesetzt, so fängt der zweite direkt unter dem Ersten an
        self.secondContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, firstContainer.frame.height, self.view.bounds.width - (kMarginForView * 2), self.view.bounds.height * (3 * kSixth)))
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, firstContainer.frame.height + secondContainer.frame.height, self.view.bounds.width - (kMarginForView * 2), self.view.bounds.height * kSixth))
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.thirdContainer)
    
        self.fourthContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height,
            self.view.bounds.width - (kMarginForView * 2), self.view.bounds.height * kSixth))
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(fourthContainer)
        
    
    
    }
    
}

