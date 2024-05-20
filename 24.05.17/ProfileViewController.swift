//
//  ProfileViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/17/24.
//

import UIKit


class ProfileViewController: UIViewController {
    
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var keyWordButton1: UIButton!
    @IBOutlet var keyWordButton2: UIButton!
    @IBOutlet var keyWordButton3: UIButton!
    @IBOutlet var keyWordButton4: UIButton!
    
    
    @IBOutlet var Image1: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var NextButton: UIButton!
    
//    private lazy var titleTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "제목을 입력해주세요"
//        textField.autocorrectionType = .no
//        textField.spellCheckingType = .no
//        return textField
//    }()
    
    
// 🌟 키보드가 안나와요~~~! -[UIKeyboardTaskQueue lockWhenReadyForMainThread] timeout waiting for task on queue 버그 같아요..

    
    override func viewDidLoad() {
        super.viewDidLoad()
        NextButton.setTitle("다음 과제", for: .normal)
       userTextField.placeholder = "신조어를 입력하세요."
        keywordButtonSetup()
      //  setupGesture()
    }
    
    private func keywordButtonSetup(){
        let buttons = [keyWordButton1, keyWordButton2, keyWordButton3, keyWordButton4]
        keyWordButton1.setTitle("윰차", for: .normal)
        keyWordButton2.setTitle("실매", for: .normal)
        keyWordButton3.setTitle("만만잘부", for: .normal)
        keyWordButton3.titleLabel?.numberOfLines = 0
        keyWordButton3.translatesAutoresizingMaskIntoConstraints = false
        
        keyWordButton4.setTitle("꾸안꾸", for: .normal)
        
               for button in buttons {
                   button?.layer.cornerRadius = 5
                   button?.layer.borderWidth = 1
                   button?.layer.borderColor = UIColor.black.cgColor
                   button?.backgroundColor = UIColor.clear
                   
               }
    }
    
    
    
    @IBAction func checkButtonClicked(_ sender: UIButton) {
      //  print(userTextField.text?.count)
        
        if let text = userTextField.text {
            if text.count >= 2 && text.count < 8 {
                if text == "바보" {
                    resultLabel.text = "다시 확인해주세요"
                } else {
                    resultLabel.text = text
                }
            } else {
                resultLabel.text = "다시 확인해주세요"
            }
        }
        
        resultLabel.text = userTextField.text
        
    }
    
    
  
    @IBAction func allButton(_ sender: UIButton, color: UIColor) {
        resetButtonBackgrounds()
       // resultLabel.text =
        
    }
    
    
    
    @IBAction func keyWordButton1AC(_ sender: UIButton) {
        resetButtonBackgrounds()
        resultLabel.text = "You 미쳤어? 촤촤촤~"
        resultLabel.textColor = UIColor.red
        keyWordButton1.backgroundColor = UIColor.yellow
       
        
    }
    
    @IBAction func keyWordButton2AC(_ sender: UIButton) {
        resetButtonBackgrounds()
        resultLabel.text = "시럽 말고 매실액기스 넣어주세요"
        resultLabel.textColor = UIColor.green
        keyWordButton2.backgroundColor = UIColor.yellow
        
        
    }
    
    @IBAction func keyWordButton3AC(_ sender: Any) {
        resetButtonBackgrounds()
        resultLabel.text = "만족하는 만세는 잘만 부자다"
        resultLabel.textColor = UIColor.orange
        keyWordButton3.backgroundColor = UIColor.yellow
     
    }
    
    @IBAction func keyWordButton4AC(_ sender: UIButton) {
        resetButtonBackgrounds()
        resultLabel.text = "꾸민듯 안 꾸민듯"
        resultLabel.textColor = UIColor.blue
        keyWordButton4.backgroundColor = UIColor.yellow
      
        
    }
    
    private func resetButtonBackgrounds() {
         let buttons = [keyWordButton1, keyWordButton2, keyWordButton3, keyWordButton4]
         for button in buttons {
             button?.backgroundColor = UIColor.clear
         }
     }
     
    
}






