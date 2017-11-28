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
    
    var nampungId : String? = nil
    var arrRest = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let params = ["id_stadion" : nampungId]
        let url = "http://localhost/Data/index.php/api/getStadion"
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler:
            { (response) in
                
                
                if response.result.isSuccess {
                    //kalau response suces kita ambil json
                    let json = JSON(response.result.value as Any)
                    print(json)
                    //get jsonaray dari json arrayq
                    self.arrRest = json["List Stadion"].arrayObject as! [[String : String]]
                    //check d log
                    //check jumlah array
                    if (self.arrRest.count > 0){
                        
                        //refresh tableview
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

        var serverid = arrRest[indexPath.row]
        
        let nama = serverid["nama"]
        let lokasi = serverid["kota"]
       
        cell.lblNama.text = nama
        cell.lblLokasi.text = lokasi
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Row \(indexPath.row)selected")
        
        let task = arrRest[indexPath.row]
        
        namaSelected = task["nama"] as! String
        kapasitasSelected = task["kapasitas"] as! String
        kotaSelected = task["kota"] as! String
        negaraSelected = task["negara"] as! String
        eventSelected = task["tuanRumah_event"] as! String

        
        performSegue(withIdentifier: "passData", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "passData" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! ViewController
                let value = arrRest[indexPath.row]
                
                controller.passNama = value["nama"] as! String
                controller.passKapasitas = value["kapasitas"] as! String
                controller.passKota = value["kota"] as! String
                controller.passNegara = value["negara"] as! String
                controller.passEvent = value["tuanRumah_event"] as! String
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
