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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        NextButton.setTitle("다음 과제", for: .normal)
       userTextField.placeholder = "신조어를 입력하세요."
        resultLabel.text = "Test Label"
        keywordButtonSetup()
    
      //  setupGesture()
    }
    
    private func keywordButtonSetup(){
        let buttons = [keyWordButton1, keyWordButton2, keyWordButton3, keyWordButton4]
        keyWordButton1.setTitle("갓생", for: .normal)
        keyWordButton2.setTitle("안습", for: .normal)
        keyWordButton3.setTitle("킹받네", for: .normal)
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
        
//        if let text = userTextField.text {
//            if text.count >= 2 && text.count < 8 {
//                if text == "바보" {
//                    resultLabel.text = "다시 확인해주세요"
//                } else {
//                    resultLabel.text = text
//                }
//            } else {
//                resultLabel.text = "다시 확인해주세요"
//            }
//        }
        
       // resultLabel.text = userTextField.text
        
    }
    
    
  
    @IBAction func allButton(_ sender: UIButton, color: UIColor) {
        
        print(sender.tag)
        
          switch sender.tag {
          case 0:
              resultLabel.text = "dfdf"
              i(button: keyWordButton1, text: "윰차", color: .white, backgroundcolor: .orange, result: "유미유미")
          case 1:
              resultLabel.text = "dfdf"
              i(button: keyWordButton2, text: "실매", color: .white, backgroundcolor: .blue, result: "유미유미")
          case 2:
              i(button: keyWordButton3, text: "만만잘부", color: .white, backgroundcolor: .green, result: "유미유미")
          case 3:
              i(button: keyWordButton4, text: "꾸안꾸", color: .white, backgroundcolor: .green, result: "유미유미")
          default:
              print("Unexpected tag: \(sender.tag)")
          }
      }


    func i(button: UIButton, text: String, color: UIColor, backgroundcolor: UIColor, result: String) {
        resetButtonBackgrounds()
        print("Updating button: \(text) with result: \(result)")
        button.setTitle(text, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.backgroundColor = backgroundcolor
        resultLabel.text = result
        print("🙇‍♀️\(resultLabel!)💡")
        resultLabel.textColor = color
    }

    
    private func resetButtonBackgrounds() {
         let buttons = [keyWordButton1, keyWordButton2, keyWordButton3, keyWordButton4]
         for button in buttons {
             button?.backgroundColor = UIColor.gray
         }
     }
     
    
}






