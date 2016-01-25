//
//  RacesTableViewController.swift
//  Pokedex
//
//  Created by g313 DIT UPM on 26/11/15.
//  Copyright © 2015 g313 DIT UPM. All rights reserved.
//

import UIKit

class RacesTableViewController: UITableViewController {
    
    var pokedexModel = PokedexModel()
    
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return pokedexModel.types.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = pokedexModel.types[section]
        return type.races.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Race Cell", forIndexPath: indexPath)
        
        let type = pokedexModel.types[indexPath.section]
        let race = type.races[indexPath.row]
        
        cell.imageView?.image = UIImage(named: "icon/\(race.icon)")
        cell.textLabel?.text = race.name
        cell.detailTextLabel?.text = race.code
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return pokedexModel.types[section].name
    }
    
        
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Show Web Info" {
            
            // El destino del segue es el Navigation Controller.
            // El primer VC apuntado por el Navigation Controller el WebVC.
            // sender es la celda de la tabla que disparo el segue.
            if let nc = segue.destinationViewController as? UINavigationController,
                let wvc = nc.topViewController as? WebViewController,
                let cell = sender as? UITableViewCell,
                let ip = tableView.indexPathForCell(cell) {
                    
                    let type = pokedexModel.types[ip.section]
                    
                    wvc.race = type.races[ip.row]
                    
                    wvc.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                    wvc.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
}
