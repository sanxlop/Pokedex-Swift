//
//  TypeTableViewController.swift
//  Pokedex
//
//  Created by g313 DIT UPM on 26/11/15.
//  Copyright © 2015 g313 DIT UPM. All rights reserved.
//


import UIKit

class TypesTableViewController: UITableViewController {
    
    var pokedexModel = PokedexModel()
    
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return pokedexModel.types.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //let type = pokedexModel.types[section]
        return 1
        
        
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Type Cell", forIndexPath: indexPath)
        
        let type = pokedexModel.types[indexPath.section]
        cell.textLabel?.text = type.name
        cell.imageView?.image = UIImage(named: "icon/\(type.icon)")
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Show races" {
            
            // El destino del segue es el Navigation Controller.
            // El primer VC apuntado por el Navigation Controller el WebVC.
            // sender es la celda de la tabla que disparo el segue.
            if  let trtvc = segue.destinationViewController as? TypeRacesTableViewController,
                let cell = sender as? UITableViewCell,
                let ip = tableView.indexPathForCell(cell) {
                    
                    
                    let type = pokedexModel.types[ip.section]
                    
                    
                    trtvc.races = type.races
                    //print(trtvc.races!)
                    
                    trtvc.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                    trtvc.navigationItem.leftItemsSupplementBackButton = true
                    
                    
                    
                    
            }
            
        }
        
        
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
