//
//  SimpleTableViewController.swift
//  AdvancedInterface
//
//  Created by user190722 on 1/25/22.
//

import UIKit

class SimpleTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MiCeldaDelegate {
    
    
    @IBOutlet weak var tableView2: UITableView!
    
    var ciudades = ["Madrid","Barcelona","Sevilla","Valencia","Teruel","Jaén","Vigo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView2.delegate = self
        tableView2.dataSource = self
        
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        //Takes care of toggling the button's title
        super.setEditing(!isEditing, animated: true)
        
        //Toggle table view editing
        tableView2.setEditing(!tableView2.isEditing, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            //Delete the row from the data source
            print("Delete button clicked at \(indexPath.section)\\\(indexPath.row)")
            ciudades.remove(at: indexPath.row)
            tableView2.reloadData()
        } else if editingStyle == .insert {
            //Create a new instance of the appropieate class, insert it into the array, and add a new row to the table view
            print("Insert button clicked at \(indexPath.section)\\\(indexPath.row)")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ciudades.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MyTableViewCell = tableView2.dequeueReusableCell(withIdentifier: "miCelda", for: indexPath) as! MyTableViewCell
        /*let cell = tableView2.dequeueReusableCell(withIdentifier: "miCelda", for: indexPath)*/
        cell.delegate = self
        
        
        let ciudad = ciudades[indexPath.row]
        
        // Configure the cell... Custom the label and show id number of every cell (UPGRADED)
        cell.setInfo(ciudad, "\(indexPath.row)")
        //cell.textLabel?.text = "\(ciudad)"
       
        /*
        if indexPath.row > 0 && indexPath.row % 2 == 1 {
            cell.backgroundColor = #colorLiteral(red: 1, green: 0.5307962839, blue: 0.2453742501, alpha: 1)
        }
 */
/*
        if indexPath.row == 1 {
            cell.backgroundColor = #colorLiteral(red: 1, green: 0.4238487293, blue: 0.1020684632, alpha: 1)
        } else {
            cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
  */
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Celda seleccionada: \(indexPath.row)")
        
    }
    
    //Override protocol of MyTableViewCell
    func callPressed(name: String) {
        print("Pulsada llamada en la celda: \(name)")
    }

}
