//
//  EmotionsViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/18/24.
//

//  🌱 코드 효율화 수정후

import UIKit

class EmotionsViewController: UIViewController {


    @IBOutlet var emotionButtons1: UIButton!
    @IBOutlet var emotionButtons2: UIButton!
    @IBOutlet var emotionButtons3: UIButton!
    
    @IBOutlet var emotionButtons4: UIButton!
    @IBOutlet var emotionButtons5: UIButton!
    @IBOutlet var emotionButtons6: UIButton!
    @IBOutlet var emotionButtons7: UIButton!
    @IBOutlet var emotionButtons8: UIButton!
    @IBOutlet var emotionButtons9: UIButton!
    
    
    
    @IBOutlet var emotionLabels: [UILabel]!
    
    
    @IBOutlet var resetButton: UIButton!
    
    
    
    var emotionCounts = [Int](repeating: 0, count: 9)
    let emotionTexts = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "피곤해", "미워해"]

    override func viewDidLoad() {
        super.viewDidLoad()
     
        // UserDefaults에서 저장된 감정 카운트를 불러오기
               if let savedEmotionCounts = UserDefaults.standard.array(forKey: "emotionCounts") as? [Int] {
                   emotionCounts = savedEmotionCounts
                   print("🤍\(emotionCounts)")
               }
        updateLabels()
    }

    
    private func updateLabels() {
        //enumerated() 순회
        for (index, label) in emotionLabels.enumerated() {
            label.text = "\(emotionTexts[index])\(emotionCounts[index])"
      print("👩‍🌾\(emotionTexts[index])\(emotionCounts[index])")
        }
    }
    
    func buttonSetUp(button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
    }
    
    func lableSetUp() {
        
    }
    
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        let tag = sender.tag
        if tag >= 0 && tag < emotionCounts.count {
                emotionCounts[tag] += 1
                updateLabelGG(for: tag)
                UserDefaults.standard.set(emotionCounts, forKey: "emotionCounts")
            }
    }
    
  
    private func updateLabelGG(for index: Int) {
        emotionLabels[index].text = "\(emotionTexts[index])\(emotionCounts[index])"
    }
    
    
    @IBAction func resetAC(_ sender: UIButton) {
      
        // 감정 카운트를 0으로 초기화
        emotionCounts = [Int](repeating: 0, count: 9)
        
        // 라벨 업데이트
        updateLabels()
        
    }
    
    
    
}


