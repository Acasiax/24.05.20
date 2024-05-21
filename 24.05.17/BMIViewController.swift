//
//  BMIViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/21/24.
//

import UIKit

class BMIViewController: UIViewController {

    
    @IBOutlet var titleLB: UILabel!
    @IBOutlet var subTitle: UILabel!
    
    @IBOutlet var iconImage: UIImageView!
    
    
    @IBOutlet var heightLB: UILabel!
    @IBOutlet var heghtTextField: UITextField!
    
    
    @IBOutlet var kgLB: UILabel!
    @IBOutlet var kgTextField: UITextField!
    
    
    @IBOutlet var randomButton: UIButton!
 
    @IBAction func randomButton(_ sender: UIButton) {
        let randomHeight = Int.random(in: 100...230) // 랜덤 키
            let randomWeight = Int.random(in: 20...200) //랜덤 몸무게

            heghtTextField.text = "\(randomHeight)"
            kgTextField.text = "\(randomWeight)"
        
    }
    @IBOutlet var resultButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textUISetup()
        setupButtonActions()
        setupTapGesture()
    }
    
        func textUISetup() {
            titleLB.text = "BMI 계산기"
            subTitle.text = "당신의 BMI 지수를\n알려드릴게요."
            subTitle.numberOfLines = 0
            heightLB.text = "키가 어떻게 되시나요?"
            kgLB.text = "몸무게는 어떻게 되시나요?"
            randomButton.setTitle("랜덤 추출", for: .normal)
            resultButton.setTitle("결과보기", for: .normal)
        }
        
        func setupButtonActions() {
            resultButton.addTarget(self, action: #selector(showBMIResult), for: .touchUpInside)
        }
        
        @objc func showBMIResult() {
            guard let heightText = heghtTextField.text, let height = Double(heightText),
                  let weightText = kgTextField.text, let weight = Double(weightText) else {
                showAlert(message: "유효한 키와 몸무게를 입력하세요.")
                return
            }
            
            let heightInMeters = height / 100
            let bmi = weight / (heightInMeters * heightInMeters)
            let formattedBMI = String(format: "%.2f", bmi)
            
            showAlert(message: "당신의 BMI 지수는 \(formattedBMI)입니다.")
        }
        
        func showAlert(message: String) {
            let alert = UIAlertController(title: "BMI 결과", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    
    
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        heghtTextField.keyboardType = .numberPad
        kgTextField.keyboardType = .numberPad
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    }
