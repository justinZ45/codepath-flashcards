//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Justin Zaluk on 3/12/22.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardsController: ViewController! //variable for flashcardsController
    
    @IBOutlet weak var questionTextField: UITextField! //outlet for question text field
    
    @IBOutlet weak var answerTextField: UITextField!  //outlet for answer text field
    
    @IBOutlet weak var extraAnswerOneTextField: UITextField!  //outlet for extra answer one text field
    
    @IBOutlet weak var extraAnswerTwoTextField: UITextField!  //outlet for extra answer two text field
    
    var initialQuestion: String?
    var initialAnswer: String?
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        questionTextField.text = initialQuestion  //grab initial question
        answerTextField.text = initialAnswer    //grab initial answer
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        //dismisses screen when cancel is tapped
        dismiss(animated: true)
    }

    
    @IBAction func didTapOnDone(_ sender: Any) {
                
        //Gets the text that is in the question text field
        let answerText = answerTextField.text
        
        //Gets the text that is in the answer text field
        let questionText = questionTextField.text
        
        //Gets the text that is in the extra answer one text field
        let extraAnswerOneText = extraAnswerOneTextField.text
        
        //Gets the text that is in the extra answer two text field
        let extraAnswerTwoText = extraAnswerTwoTextField.text
        
        //Check if empty
        if (questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty)
        {
            //show error
            let alert = UIAlertController(title: "Missing text", message: "A question and answer must both be entered", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            
            present(alert, animated: true)
        }
        
        else
        {
        //Calls function to update the flashcard
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, extraAnswerOne: extraAnswerOneText!, extraAnswerTwo: extraAnswerTwoText!)
        
        //Dismisses screen
        dismiss(animated: true)
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
