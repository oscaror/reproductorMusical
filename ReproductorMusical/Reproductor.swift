//
//  Reproductor.swift
//  ReproductorMusical
//
//  Created by Oscar Ortega on 20/06/16.
//  Copyright © 2016 Ozzcorp. All rights reserved.
//

import UIKit
import AVFoundation

class Reproductor: UIViewController {
    
    @IBOutlet weak var portada: UIImageView!
    @IBOutlet weak var nombreCancion: UILabel!
    @IBOutlet weak var interprete: UILabel!
    @IBOutlet weak var volumen: UISlider!
    
    var cancion : String = ""
    var interpreteCancion : String = ""
    var portadaAlbum : String = ""
    
    var reproductor : AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nombreCancion.text = cancion
        interprete.text = interpreteCancion
        portada.image = UIImage(named: portadaAlbum)
        
        let sonidoUrl = NSBundle.mainBundle().URLForResource(cancion, withExtension: ".mp3")
        //verificarPortada(cancion)
        
        do{
            try reproductor = AVAudioPlayer (contentsOfURL: sonidoUrl!)
            reproductor.play()
        }catch{
            print ("Error al cargar el archivo")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    @IBAction func play() {
        if !reproductor.playing{
            reproductor.play()
        }
    }

    @IBAction func pause() {
        if reproductor.playing{
            reproductor.pause()
        }
    }
    
    @IBAction func stop() {
        if reproductor.playing{
            reproductor.stop()
            reproductor.currentTime = 0.0
        }
    }
    
    @IBAction func ajusteVolumen(sender: UISlider) {
        let selectedValue = Float(sender.value)
        reproductor.volume = selectedValue
    }
    
    
//    func verificarPortada (nombre : String){
//        if (nombre == "Canon In D"){
//            portada.image = UIImage(named: "Canon In D Cover.jpg")
//            
//        }else if (nombre == "Power"){
//            portada.image = UIImage(named: "Power Cover.jpg")
//            
//        }else if (nombre == "Symphony Of Destruction"){
//            portada.image = UIImage(named: "Symphony Of Destruction Cover.jpg")
//            
//        }else if (nombre == "Everybody Wants to Rule the World"){
//            portada.image = UIImage(named: "Everybody Wants to Rule the World Cover.jpg")
//            
//        }else if (nombre == "Working For The Weekend"){
//            portada.image = UIImage(named: "Working For The Weekend Cover.jpg")
//        
//        }else if (nombre == "Highway to the Danger Zone"){
//            portada.image = UIImage(named: "Highway to the Danger Zone Cover")
//            
//        }else if (nombre == "Mr.Roboto"){
//            portada.image = UIImage(named: "Mr.Roboto Cover")
//            
//        }else if (nombre == "Strangers In The Night"){
//            portada.image = UIImage(named: "Strangers In The Night Cover")
//            
//        }else if (nombre == "Suicide Mission"){
//            portada.image = UIImage(named: "Suicide Mission Cover")
//            
//        }else if (nombre == "por")
//        
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
