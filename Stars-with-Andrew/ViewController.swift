//
//  ViewController.swift
//  Stars-with-Andrew
//
//  Created by Ilgar Ilyasov on 9/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    var starController = StarController()
    
    @IBAction func create(_ sender: Any) {
        guard let name = nameTextField.text,
              let distanceString = distanceTextField.text,
              let distance = Double(distanceString) else { return }
        
        starController.createStar(withName: name, distance: distance)
        starController.saveToPersistenceStore()
    }
    
    
    @IBAction func listStars(_ sender: Any) {
        var output = ""
        for star in starController.stars {
            output += "\(star.name) is \(star.distance) light years away.\n"
        }
        textView.text = output
    }
}

