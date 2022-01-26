//
//  ViewController.swift
//  AdvancedInterface
//
//  Created by user190722 on 1/21/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnEdit: UIButton!
    
    @IBOutlet weak var switch1: UISwitch!
    
    @IBOutlet weak var btnBorderRadius: UIButton!
    
    @IBOutlet weak var segmControl: UISegmentedControl!
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switch1.setOn(true, animated: true)
        
        //Redondear el borde del botón y darle fondo:
        btnBorderRadius.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        btnBorderRadius.layer.cornerRadius = 12
        btnBorderRadius.layer.borderWidth = 2
        btnBorderRadius.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        btnBorderRadius.setTitleColor(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), for: .normal)
    }
    
    
    @IBAction func btnEditPressed(_ sender: UIButton) {
        print("Button Edit pressed")
        btnEdit.isEnabled = false
        
        let url = URL(string:  "https://images.unsplash.com/photo-1593642634367-d91a135587b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80")
        
        if let urlImage = url {
            
            let data = try? Data(contentsOf: urlImage)
            
            if let imageData = data {
                let imageLoading = UIImage(data: imageData)
                image.image = imageLoading
            }
        }

    }
    
    //Carga la vista de Stack
    @IBAction func stackViewwPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "stackViewId", sender: nil)
    }
    
    //Carga la vista de Scroll
    @IBAction func scrollViewPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "scrollViewId", sender: nil)
    }
    
    //Carga la vista de TableView del Controlador de Tablas
    @IBAction func tableViewPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "tableViewControllerId", sender: nil)
    }
    
    //Carga la vista de TableView normal
    @IBAction func tableViewPressed2(_ sender: UIButton) {
        performSegue(withIdentifier: "tableViewId", sender: nil)
    }
    
    @IBAction func collectionViewPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "collectionViewId", sender: nil)
    }
    
    @IBAction func switch1ValueChanged(_ sender: UISwitch) {
        print("Switch1ValueChanged: ")
        print(sender.isOn)
    }
    
    @IBAction func segmValueChanged(_ sender: UISegmentedControl) {
        print("segmValueChanged")
        print(sender.selectedSegmentIndex)
        let idValue = sender.selectedSegmentIndex
        if idValue == 0 {
            image.image = UIImage.init(named:"image1")
        } else if idValue == 1 {
            image.image = UIImage.init(named:"image2")
        } else if idValue == 2 {
            image.image = UIImage.init(named:"image3")
        } else {
            print("Image is not available")
        }
    }
}

