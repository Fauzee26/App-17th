//
//  StadionTableViewController.swift
//  StadionMap
//
//  Created by Muhammad Hilmy Fauzi on 27/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class StadionTableViewController: UITableViewController {
    
    var namaSelected:String?
    var kapasitasSelected:String?
    var kotaSelected:String?
    var negaraSelected:String?
    var eventSelected:String?
    
    var arrRest = [[String : String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let params = ["nama" : namaSelected]
        let url = "http://localhost/Data/index.php/api/getStadion"

        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (response) in
            //check response
            if response.result.isSuccess {
                let json = JSON(response.result.value as Any)
                print(json)
                self.arrRest = json["List Stadion"].arrayObject as! [[String : String]]
                
                if(self.arrRest.count > 0){
                    self.tableView.reloadData()
                }
            }else{
                print("Error Server")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrRest.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StadionTableViewCell

        var task = arrRest[indexPath.row]
        
        let nama = task["nama"]
        let lokasi = task["kota"]
       
        cell.lblNama.text = nama
        cell.lblLokasi.text = lokasi
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Row \(indexPath.row)selected")
        
        let task = arrRest[indexPath.row]
        
        namaSelected = task["nama"]
        kapasitasSelected = task["kapasitas"]
        kotaSelected = task["kota"]
        negaraSelected = task["negara"]
        eventSelected = task["tuanRumah_event"]

        
        performSegue(withIdentifier: "passData", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "passData" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! ViewController
                let task = arrRest[indexPath.row]
                
                controller.passNama = task["nama"]
                controller.passKapasitas = task["kapasitas"]
                controller.passKota = task["kota"]
                controller.passNegara = task["negara"]
                controller.passEvent = task["tuanRumah_event"]
            }
        }
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
