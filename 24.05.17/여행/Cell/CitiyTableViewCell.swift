//
//  CitiyTableViewCell.swift
//  24.05.17
//
//  Created by 이윤지 on 5/27/24.
//

import UIKit

class CitiyTableViewCell: UITableViewCell {
    
    @IBOutlet var cityImage: UIImageView!
    @IBOutlet var heartImageView: UIImageView!
    @IBOutlet var titleLB: UILabel!
    @IBOutlet var subTitleLB: UILabel!
    @IBOutlet var pointLB: UILabel!
    @IBOutlet var saveCount: UILabel!
    
    
//    버튼 리스트 초기화 위치
//    viewDidLoad에서 선언
//    lazy var를 사용하여 초기화 시점을 지연
//    lazy var 사용 이유
//    초기화 시점을 지연시켜 버튼과 리스트가 동시에 초기화되는 문제를 해결
//    스택뷰 초기화
//    스택뷰에서도 lazy var를 사용하여 초기화 시점을 지연
    
    
    static let indentifier1 = "CitiyTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: indentifier1, bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //  🌟tableView.rowHeight = 120 //이거 말고 오토매틱 디멘션 사용하기🌟
        cityImage.layer.cornerRadius = 10
        cityImage.clipsToBounds = true
        // 폰트 스타일 설정
                titleLB.font = UIFont.boldSystemFont(ofSize: 16)
                subTitleLB.font = UIFont.systemFont(ofSize: 14)
                subTitleLB.textColor = .darkGray
                subTitleLB.numberOfLines = 0
                pointLB.font = UIFont.systemFont(ofSize: 14)
                pointLB.textColor = .systemYellow
                saveCount.font = UIFont.systemFont(ofSize: 14)
                saveCount.textColor = .gray
                
                // 이미지 초기 설정
                heartImageView.image = UIImage(systemName: "heart")
                heartImageView.tintColor = .red
            }

            override func setSelected(_ selected: Bool, animated: Bool) {
                super.setSelected(selected, animated: animated)
            }
            
            func configure(with travel: Travel) {
                titleLB.text = travel.title
                subTitleLB.text = travel.description
                pointLB.text = "\(travel.grade ?? 0.0)🥕"
                var savedata = travel.save?.formatted()
                saveCount.text = "저장 \(savedata ?? "미지수")"
                
                if let urlString = travel.travel_image, let url = URL(string: urlString) {
                    URLSession.shared.dataTask(with: url) { data, response, error in
                        if let data = data {
                            DispatchQueue.main.async {
                                self.cityImage.image = UIImage(data: data)
                            }
                        }
                    }.resume()
                } else {
                    cityImage.image = UIImage(systemName: "photo")
                }
                
                heartImageView.image = travel.like ?? false ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
            }
        }
