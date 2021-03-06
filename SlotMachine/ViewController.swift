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
    
    
    // Inhalt FirstContainer
    
    var titleLabel: UILabel!
    
    // Inhalt thirdContainer
    
    var creditsLabel: UILabel!                  //Fünf verschiedene Anzeigen!
    var betLabel: UILabel!
    var winnerPaidLabel: UILabel!
    
    var creditTitleLabel: UILabel!
    var betTitleLabel: UILabel!
    var winnerPaidTitleLabel: UILabel!
    
    // Buttons in FourthContainer
    
    var resetButton : UIButton!
    var betOneButton: UIButton!
    var betMaxButton:UIButton!
    var spinButton:UIButton!
    
    //Slots Array
    
    var slots: [[Slot]] = []
 
    // Stats
    
    var credits:Int = 0
    var currentBet:Int = 0
    var winnings:Int = 0
    
    
    
    
    //Constants
    
        // Konstante für Abstand
    let kMarginForView: CGFloat = 10.0    // 10 Punkte
    let kMarginForSlot: CGFloat = 2
        // Konstante für Höhe
    let kSixth:CGFloat = 1.0 / 6.0           // Ein Sechstel
    let kThird:CGFloat = 1.0 / 3.0
    let kHalf:CGFloat = 1.0 / 2.0
    let kEighth:CGFloat = 1.0 / 8.0
    
    let knumberOfColums = 3
    let knumberOfRows = 3
    
    
   
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        
        
        //Hier werden die unten erstellten Funktionen aufgerufen
        //Testkommentar für Stefan
        
        setupContainerViews()
        
        setupFirstContainer(self.firstContainer)    // weg, wegen hardReset
    
        // setupSecondContainer(self.secondContainer)
        
        setUpThirdContainer(self.thirdContainer)
        
        setupFourthContainer(self.fourthContainer)
        
        hardReset()
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }

    //IBActions
    
    func resetButtonPressed (button:UIButton) {
        hardReset()
    }
    
    func betOneButtonPressed (button:UIButton) {
        println("Bet One Button pressed")
    }
    
    func betMaxButtonPressed (button:UIButton) {
        println("Bet Max Button pressed")
    }
    
    func spinButtonPressed (button:UIButton)  {
        println("Spin Button pressed")
    
    removeSlotImageViews()
        
    slots = Factory.createSlots()
    
    setupSecondContainer(self.secondContainer)
    
    }
    
    
    
    
    //self. kann hier für view verwendet werden, weil im Storyboard der View existiert
        // Die Konstante wird zur Eingansposition von x addiert (in der linken, oberen Ecke) und von der Weite 2 x abgezogen. Die Höhe wird mit 1/6 multipliziert
    func setupContainerViews() {
        self.firstContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, self.view.bounds.origin.y, self.view.bounds.width - (kMarginForView * 2), self.view.bounds.height * kSixth))
        self.firstContainer.backgroundColor = UIColor.redColor()
        // Der eben erstellte firstContainer wird "view" als Subview hinzugefügt
        self.view.addSubview(self.firstContainer)
        
        // Der Y-Wert wird hier auf die Höhe des ersten Containers gesetzt, so fängt der zweite direkt unter dem Ersten an
        self.secondContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, self.firstContainer.frame.height, self.view.bounds.width - (kMarginForView * 2), self.view.bounds.height * (3 * kSixth)))
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, self.firstContainer.frame.height + self.secondContainer.frame.height, self.view.bounds.width - (kMarginForView * 2),
            self.view.bounds.height * kSixth))
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.thirdContainer)
    
        self.fourthContainer = UIView(frame: CGRectMake(self.view.bounds.origin.x + kMarginForView, self.firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height,
            self.view.bounds.width - (kMarginForView * 2), self.view.bounds.height * kSixth))
        self.fourthContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(fourthContainer)
        
    }
    
    
    
        // Jetzt wird auf den ersten (obersten) Container ein Label drauf gesetzt
    func setupFirstContainer(containerView:UIView) {
        self.titleLabel = UILabel()
        self.titleLabel.text = "Super Slots"
        self.titleLabel.textColor = UIColor.yellowColor()
        self.titleLabel.font = UIFont(name: "Markerfelt-Wide", size: 40)
        // Past die Grösse des Labels der Schriftgrösse und dem Text an
        self.titleLabel.sizeToFit()
        self.titleLabel.center = containerView.center
        
        containerView.addSubview(self.titleLabel)
    }
        // Jetzt auf den Zweiten (Von oben) die 9 gelben Quadrate
    
    func setupSecondContainer(containerView:UIView) {
        
        for var columNumber = 0; columNumber < knumberOfColums; ++columNumber {     // knumberOfColums ist 3, also zählt er 0,1,2 also 3 x
            for var rowNumber = 0; rowNumber < knumberOfRows; ++rowNumber {         // knumberOfRows   ist 3, also zählt er 0,1,2 also 3 x
                
                var slot: Slot                                                      // Kommt aus Slots.swift
                var slotImageView = UIImageView()                                   // Variable "slotImageView" soll ein UIImageView sein, also Platzhalter für ein Image
                
                if slots.count != 0 {
                    let slotcontainer = slots[columNumber]
                    slot = slotcontainer[rowNumber]
                    slotImageView.image = slot.image
                }
                else {
                    slotImageView.image = UIImage(named: "Ace")
                
                }
                
                
                
                slotImageView.frame = CGRectMake(containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(columNumber) * kThird), containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(rowNumber) * kThird), containerView.bounds.width * kThird - kMarginForSlot, containerView.bounds.height * kThird - kMarginForSlot)
                containerView.addSubview(slotImageView)
            }
        }
    
    }
    
    func setUpThirdContainer(containerView:UIView)  {
        
        self.creditsLabel = UILabel()
        self.creditsLabel.text = "000000"
        self.creditsLabel.textColor = UIColor.redColor()
        self.creditsLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.creditsLabel.sizeToFit()
        self.creditsLabel.center = CGPointMake(containerView.frame.width * kSixth, containerView.frame.height * kThird)
        self.creditsLabel.textAlignment = NSTextAlignment.Center
        self.creditsLabel.backgroundColor = UIColor.darkGrayColor()
        
        containerView.addSubview(self.creditsLabel)
        
        self.betLabel = UILabel()
        self.betLabel.text = "000000"
        self.betLabel.textColor = UIColor.redColor()
        self.betLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.betLabel.sizeToFit()
        self.betLabel.center = CGPointMake(containerView.frame.width * kSixth * 3, containerView.frame.height * kThird)
        self.betLabel.textAlignment = NSTextAlignment.Center
        self.betLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.betLabel)
        
        self.winnerPaidLabel = UILabel()
        self.winnerPaidLabel.text = "000000"
        self.winnerPaidLabel.textColor = UIColor.redColor()
        self.winnerPaidLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.winnerPaidLabel.sizeToFit()
        self.winnerPaidLabel.center = CGPointMake(containerView.frame.width * kSixth * 5, containerView.frame.height * kThird)
        self.winnerPaidLabel.textAlignment = NSTextAlignment.Center
        self.winnerPaidLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.winnerPaidLabel)
        
        
        
        self.creditTitleLabel = UILabel()
        self.creditTitleLabel.text = "Credits"
        self.creditTitleLabel.textColor = UIColor.blackColor()
        self.creditTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.creditTitleLabel.sizeToFit()
        self.creditTitleLabel.center = CGPointMake(containerView.frame.width * kSixth, containerView.frame.height * kThird * 2)
        self.creditTitleLabel.textAlignment = NSTextAlignment.Center
        containerView.addSubview(self.creditTitleLabel)
        
        self.betTitleLabel = UILabel()
        self.betTitleLabel.text = "Bet"
        self.betTitleLabel.textColor = UIColor.blackColor()
        self.betTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.betTitleLabel.sizeToFit()
        self.betTitleLabel.center = CGPointMake(containerView.frame.width * kSixth * 3, containerView.frame.height * kThird * 2)
        self.betTitleLabel.textAlignment = NSTextAlignment.Center
        containerView.addSubview(self.betTitleLabel)
        
        self.winnerPaidTitleLabel = UILabel()
        self.winnerPaidTitleLabel.text = "Paid"
        self.winnerPaidTitleLabel.textColor = UIColor.blackColor()
        self.winnerPaidTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
        self.winnerPaidTitleLabel.sizeToFit()
        self.winnerPaidTitleLabel.center = CGPointMake(containerView.frame.width * kSixth * 5, containerView.frame.height * kThird * 2)
        self.winnerPaidTitleLabel.textAlignment = NSTextAlignment.Center
        containerView.addSubview(self.winnerPaidTitleLabel)
    }
    
    func setupFourthContainer(containerView:UIView) {
    
        self.resetButton = UIButton()
        self.resetButton.setTitle(" Reset ", forState: UIControlState.Normal)
        self.resetButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.resetButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)           // ? bedeutet, das es optional ist, ob es angezeigt wird.
        self.resetButton.backgroundColor = UIColor.lightGrayColor()
        self.resetButton.sizeToFit()
        self.resetButton.center = CGPointMake(containerView.frame.width * kEighth, containerView.frame.height * kHalf)
        self.resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)  // Mit dem Doppelpunkt wird eine Funktion kreiert, die dann oben aufgerufen wird
        containerView.addSubview(self.resetButton)
        
        self.betOneButton = UIButton()
        self.betOneButton.setTitle("Bet One", forState: UIControlState.Normal)
        self.betOneButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.betOneButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)             // ? bedeutet, das es optional ist, ob es angezeigt wird.
        self.betOneButton.backgroundColor = UIColor.greenColor()
        self.betOneButton.sizeToFit()
        self.betOneButton.center = CGPointMake(containerView.frame.width * 3 * kEighth , containerView.frame.height * kHalf)
        self.betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)  // Mit dem Doppelpunkt wird eine Funktion kreiert, die dann oben aufgerufen wird
        containerView.addSubview(self.betOneButton)
        
        self.betMaxButton = UIButton()
        self.betMaxButton.setTitle("Bet Max", forState: UIControlState.Normal)
        self.betMaxButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.betMaxButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)             // ? bedeutet, das es optional ist, ob es angezeigt wird.
        self.betMaxButton.backgroundColor = UIColor.redColor()
        self.betMaxButton.sizeToFit()
        self.betMaxButton.center = CGPointMake(containerView.frame.width * 5 * kEighth , containerView.frame.height * kHalf)
        self.betMaxButton.addTarget(self, action: "betMaxButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)  // Mit dem Doppelpunkt wird eine Funktion kreiert, die dann oben aufgerufen wird
        containerView.addSubview(self.betMaxButton)

        self.spinButton = UIButton()
        self.spinButton.setTitle("  Spin  ", forState: UIControlState.Normal)
        self.spinButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.spinButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)             // ? bedeutet, das es optional ist, ob es angezeigt wird.
        self.spinButton.backgroundColor = UIColor.greenColor()
        self.spinButton.sizeToFit()
        self.spinButton.center = CGPointMake(containerView.frame.width * 7 * kEighth , containerView.frame.height * kHalf)
        self.spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)  // Mit dem Doppelpunkt wird eine Funktion kreiert, die dann oben aufgerufen wird
        containerView.addSubview(self.spinButton)

        }
    

// Helpers
    
// Nach jedem neuen Spin, die alten Karten löschen. Werden sonst imer oben drauf gesetzt und müllen den Speicher voll!
    
    func removeSlotImageViews() {
    
        if self.secondContainer != nil {           // is not equal
            let container: UIView? = self.secondContainer!
            
            let subViews:Array? = container!.subviews
            for view in subViews!  {
            view.removeFromSuperview()                                  //Unlinks the view from its superview and its window, and removes it from the responder chain.
            
            
            }
        }
    }
    
    func hardReset() {
        removeSlotImageViews()
        slots.removeAll(keepCapacity: true)
        self.setupSecondContainer(self.secondContainer)
        credits = 50
        winnings = 0
        currentBet = 0
    
    }





}

















