//
//  ViewController.swift
//  Yang-Examples
//
//  Created by windy on 2023/12/19.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    enum TestCase: Int {
        case base, baseBuilder
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let row = TestCase(rawValue: indexPath.row) else { return }
        
        let vc: UIViewController
        
        switch row {
        case .base:           vc = BaseViewController()
        case .baseBuilder:    vc = BaseBuilderViewController()
        }
        
        present(vc, animated: true)
        
    }

}

