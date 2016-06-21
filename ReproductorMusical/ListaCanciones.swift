//
//  ListaCanciones.swift
//  ReproductorMusical
//
//  Created by Oscar Ortega on 20/06/16.
//  Copyright © 2016 Ozzcorp. All rights reserved.
//

import UIKit

class ListaCanciones: UITableViewController {
    
    var arregloCanciones : Array<Array<String>> = Array<Array<String>>() 
    var shuffle : Bool = false
    var cancionRandom : String = ""
    var interpreteRandom : String = ""
    var portadaRandom : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        arregloCanciones.append(["Canon In D", "Pachelbel", "Canon In D Cover.jpg"])
        arregloCanciones.append(["Power", "Kanye West", "Power Cover.jpg"])
        arregloCanciones.append(["Symphony Of Destruction", "Megadeth", "Symphony Of Destruction Cover.jpg"])
        arregloCanciones.append(["Everybody Wants to Rule the World", "Tears for Fears", "Everybody Wants to Rule the World Cover.jpg"])
        arregloCanciones.append(["Working For The Weekend", "LoverBoy", "Working For The Weekend Cover.jpg"])
        arregloCanciones.append(["Strangers In The Night", "Frank Sinatra", "Strangers In The Night Cover.jpg"])
        arregloCanciones.append(["Suicide Mission", "Jack Wall", "Suicide Mission Cover.jpg"])
        arregloCanciones.append(["What I Got", "Sublime", "What I Got Cover.jpg"])
        arregloCanciones.append(["Mr.Roboto", "Styx", "Mr.Roboto Cover.jpg"])
        arregloCanciones.append(["Highway to the Danger Zone", "Kenny Loggins", "Highway to the Danger Zone Cover.jpg"])

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    @IBAction func aleatorio(sender: UIBarButtonItem) {
        let item = arregloCanciones.randomItem()
        print(item[0])
        print(item[1])
        if (item[0] == "Canon In D"){
            cancionRandom = item[0]
            interpreteRandom = item[1]
            portadaRandom = item[2]
        }
        else if (item[0] == "Power"){
            cancionRandom = item[0]
            interpreteRandom = item[1]
            portadaRandom = item[2]
        }
        else if (item[0] == "Symphony Of Destruction"){
            cancionRandom = item[0]
            interpreteRandom = item[1]
            portadaRandom = item[2]
        }
        else if (item[0] == "Everybody Wants to Rule the World"){
            cancionRandom = item[0]
            interpreteRandom = item[1]
            portadaRandom = item[2]
        }
        else if (item[0] == "Working For The Weekend"){
            cancionRandom = item[0]
            interpreteRandom = item[1]
            portadaRandom = item[2]
        }
        else if (item[0] == "Strangers In The Night"){
            cancionRandom = item[0]
            interpreteRandom = item[1]
            portadaRandom = item[2]
        }
        else if (item[0] == "Suicide Mission"){
            cancionRandom = item[0]
            interpreteRandom = item[1]
            portadaRandom = item[2]
        }
        else if (item[0] == "What I Got"){
            cancionRandom = item[0]
            interpreteRandom = item[1]
            portadaRandom = item[2]
        }
        else if (item[0] == "Mr.Roboto"){
            cancionRandom = item[0]
            interpreteRandom = item[1]
            portadaRandom = item[2]
        }
        else if (item[0] == "Highway to the Danger Zone"){
            cancionRandom = item[0]
            interpreteRandom = item[1]
            portadaRandom = item[2]
        }
        shuffle = true
        performSegueWithIdentifier("pushReproductor", sender: self)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arregloCanciones.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.arregloCanciones[indexPath.row][0]
        cell.detailTextLabel?.text = self.arregloCanciones[indexPath.row][1]

        return cell
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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if shuffle == false {
            let rpv = segue.destinationViewController as! Reproductor
            let ip = self.tableView.indexPathForSelectedRow
            rpv.cancion = self.arregloCanciones[ip!.row][0]
            rpv.interpreteCancion = self.arregloCanciones[ip!.row][1]
            rpv.portadaAlbum = self.arregloCanciones[ip!.row][2]
        }
        else {
            let rpv = segue.destinationViewController as! Reproductor
            rpv.cancion = self.cancionRandom
            rpv.interpreteCancion = self.interpreteRandom
            rpv.portadaAlbum = self.portadaRandom
            shuffle = false
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}

extension Array{
    func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

