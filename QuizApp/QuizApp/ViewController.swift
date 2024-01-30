
//
//  ViewController.swift
//  QuizApp
//
//  Created by zehra özer on 21.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let score = UserDefaults.standard.string(forKey: "score") ?? "0"
        lblScore.text = "last score: \(score)"
    }



}


