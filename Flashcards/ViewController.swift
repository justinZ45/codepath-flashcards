//
//  ViewController.swift
//  Flashcards
//
//  Created by Justin Zaluk on 2/26/22.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
    var extraAnswerOne: String
    var extraAnswerTwo: String
}

class ViewController: UIViewController {

    
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    //Array to hold flashcards
    var flashcards = [Flashcard]()
    
    //Current index of flashcard
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Read saved flashcards
        readSavedFlashcards()
        
        //Adding intial flashcard if needed
        
        if flashcards.count == 0 {
        updateFlashcard(question: "Who Was the Only President to Serve for More than Two Terms?", answer: "Franklin Delano Roosevelt", extraAnswerOne: "William Howard Taft", extraAnswerTwo: "Theodore Roosevelt",
            isExisting: false)
        } else {
            updateLabels()
            updateNextPrevButtons()
        }
        
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
        btnOptionOne.layer.borderColor = #colorLiteral(red: 0, green: 0.716732204, blue: 1, alpha: 1)

        btnOptionTwo.layer.cornerRadius = 20.0;
        btnOptionTwo.clipsToBounds = true;
        btnOptionTwo.layer.borderWidth = 3.0;
        btnOptionTwo.layer.borderColor =  #colorLiteral(red: 0, green: 0.716732204, blue: 1, alpha: 1)
        
        btnOptionThree.layer.cornerRadius = 20.0;
        btnOptionThree.clipsToBounds = true;
        btnOptionThree.layer.borderWidth = 3.0;
        btnOptionThree.layer.borderColor =  #colorLiteral(red: 0, green: 0.716732204, blue: 1, alpha: 1)
        
        view.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //destination of segue is Navigation Controller
        let navigationController = segue.destination as! UINavigationController
        
        //Navigation controller contains CreationViewController
        let creationController = navigationController.topViewController as! CreationViewController
        
        //set flashcards property to self
        creationController.flashcardsController = self
        
        if segue.identifier == "EditSegue" {
        creationController.initialQuestion = frontLabel.text
        creationController.initialAnswer = backLabel.text
        }
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
    
    func updateFlashcard(question: String, answer: String, extraAnswerOne: String, extraAnswerTwo: String, isExisting: Bool) {
        
        let flashcard = Flashcard(question: question, answer: answer,
        extraAnswerOne: extraAnswerOne, extraAnswerTwo: extraAnswerTwo)
        
        if isExisting {
            
            //Replace existing flashcard
            flashcards[currentIndex] = flashcard
            
            
        } else {
        
        //Add flashcard to the flashcards array
        flashcards.append(flashcard)
        
        //Logging to the console
        print("😎 Added new flashcard")
        print("😎 We now have \(flashcards.count) flashcards")
        
        //Update current index
        currentIndex = flashcards.count - 1
        print("😎 Our current index is \(currentIndex)")
            
        }
        
        //Update buttons
        updateNextPrevButtons()
        
        //Update labels
        updateLabels()
        
        //Save to disk
        saveAllFlashcardsToDisk()
        
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
    
    
    @IBAction func didTapOnNext(_ sender: Any) {
        
        //Increase current index
        currentIndex = currentIndex + 1
        
        //Update labels
        updateLabels()
        
        //Update buttons
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        
        //Decrease current index
        currentIndex = currentIndex - 1
        
        //Update labels
        updateLabels()
        
        //Update buttons
        updateNextPrevButtons()
    }
    
    func updateNextPrevButtons() {
        
        //Disable next button if at the end
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        
        //Disable prev button if at the beginning
        if currentIndex == 0{
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels() {
        
        //Get current flashcard
        let currentFlashcard = flashcards[currentIndex]
        
        //Update labels
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
        
        btnOptionOne.setTitle(currentFlashcard.extraAnswerOne, for: .normal)
        btnOptionTwo.setTitle(currentFlashcard.answer, for: .normal)
        btnOptionThree.setTitle(currentFlashcard.extraAnswerTwo, for: .normal)
        
    }
    
    func saveAllFlashcardsToDisk() {
        
        //From flashcard array to dictionary array
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer, "extraAnswerOne": card.extraAnswerOne, "extraAnswerTwo": card.extraAnswerTwo]
        }
        //Save array on disk using UserDefaults
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        //Log it
        print("🎉 Flashcards saved to UserDefaults")
    }
     
    func readSavedFlashcards () {
        
        //Read dictionary array from disk (if any)
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
            
            //In here we know for sure we have a dictionary array
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!, extraAnswerOne: dictionary["extraAnswerOne"]!, extraAnswerTwo: dictionary["extraAnswerTwo"]!)
            }
            
            //Put all these cards in our flashcards array
            flashcards.append(contentsOf: savedCards)
        }
        
    }
    
    @IBAction func didTapOnDelete(_ sender: Any) {
        
        //Show confirmation
        let alert = UIAlertController(title: "Delete flashcard", message: "Are you sure you want to delete it?", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { action in
            self.deleteCurrentFlashcard()
        }
        
        alert.addAction(deleteAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func deleteCurrentFlashcard(){
        
        //Delete current flashcard
        flashcards.remove(at: currentIndex)
        
        //Special case: Check if last card was deleted
        if currentIndex > flashcards.count - 1 {
            currentIndex = flashcards.count - 1
        }
        
        
        updateNextPrevButtons()
        
        updateLabels()     //update using functions
        
        saveAllFlashcardsToDisk()
    }
    
    
}


