//
//  ChattingViewController.swift
//  24.05.17
//
//  Created by 이윤지 on 5/31/24.
//

import UIKit

class ChattingViewController: UIViewController {
    
    @IBOutlet var chatSearchBar: UISearchBar!

    @IBOutlet var chattableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }


}


extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
   
}



extension ChattingViewController: UISearchBar {
  
}
