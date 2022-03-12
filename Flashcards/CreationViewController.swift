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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        //Calls function to update the flashcard
        flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
        
        //Dismisses screen
        dismiss(animated: true)
        
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
