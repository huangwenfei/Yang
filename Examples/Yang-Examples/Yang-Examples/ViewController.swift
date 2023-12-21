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
        case make, update, remake, baseBuilder
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let row = TestCase(rawValue: indexPath.row) else { return }
        
        let vc: UIViewController
        
        switch row {
        case .make:           vc = BaseViewController()
        case .update:         vc = BaseUpdateViewController()
        case .remake:         vc = BaseRemakeViewController()
        case .baseBuilder:    vc = BaseBuilderViewController()
        }
        
        present(vc, animated: true)
        
    }

}

