//
//  ViewController.swift
//  StadionMap
//
//  Created by Muhammad Hilmy Fauzi on 24/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelNama: UILabel!
    @IBOutlet weak var labelKapasitas: UILabel!
    @IBOutlet weak var labelKota: UILabel!
    @IBOutlet weak var labelNegara: UILabel!
    @IBOutlet weak var labelEvent: UILabel!
    
    var passNama:String?
    var passKapasitas:String?
    var passKota:String?
    var passNegara:String?
    var passEvent:String?
    
    override func viewDidLoad() {
        
        labelNama.text = passNama
        labelKapasitas.text = "Kapasitas: " + passKapasitas!
        labelKota.text = "Kota: " + passKota!
        labelNegara.text = "Negara: " + passNegara!
        labelEvent.text = passEvent
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

