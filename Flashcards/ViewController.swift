//
//  ViewController.swift
//  Flashcards
//
//  Created by Justin Zaluk on 2/26/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Styling options for the flashcard
        //Round corners and shadow
        card.layer.cornerRadius = 20.0;
        card.layer.shadowRadius = 15.0;
        card.layer.shadowOpacity = 0.5;
        
        backLabel.layer.cornerRadius = 20.0;
        backLabel.clipsToBounds = true;
        
        frontLabel.layer.cornerRadius = 20.0;
        frontLabel.clipsToBounds = true;
        
        btnOptionOne.layer.cornerRadius = 20.0;
        btnOptionOne.clipsToBounds = true;
        btnOptionOne.layer.borderWidth = 3.0;
        btnOptionOne.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1);

        btnOptionTwo.layer.cornerRadius = 20.0;
        btnOptionTwo.clipsToBounds = true;
        btnOptionTwo.layer.borderWidth = 3.0;
        btnOptionTwo.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1);
        
        btnOptionThree.layer.cornerRadius = 20.0;
        btnOptionThree.clipsToBounds = true;
        btnOptionThree.layer.borderWidth = 3.0;
        btnOptionThree.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1);
        
        view.backgroundColor = #colorLiteral(red: 0.9704111218, green: 0.9603078961, blue: 0.9692524076, alpha: 1);
        
    }
     
      //hides & unhides card when tapped
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if(frontLabel.isHidden == true)
        {
        frontLabel.isHidden = false;
        }
        else{
            frontLabel.isHidden = true;
        }
    }
    
    //button functions to check for correct answer when user taps them
    @IBAction func didTapOptionOne(_ sender: Any) {
        btnOptionOne.isHidden = true;
    }
    
    @IBAction func didTapOptionTwo(_ sender: Any) {
        frontLabel.isHidden = true;
    }
    
    @IBAction func didTapOptionThree(_ sender: Any) {
        btnOptionThree.isHidden = true;
    }
}

