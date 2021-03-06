//
//  PesquisaViewController.swift
//  TTDD
//
//  Created by Macintosh HD on 18/11/19.
//  Copyright © 2019 Macintosh HD. All rights reserved.
//

import UIKit

class PesquisaViewController: UIViewController {

    @IBOutlet weak var editTextSearch: UITextField!
    @IBOutlet weak var editTextWord: UITextField!
    
    var simbolosValidos:[String]=[ "000","000","001","002","002","002.01","002.1","002.11","002.12","002.2","003","003","003.01","003.1","003.2","003.3","004","004.1","004.11","004.12","004.2","004.21","004.22","005","005.1","005.2","010","010","010.01","011","012","013","013.1","013.2","014","014.1","014.2","014.3","014.4","015","015.1","015.2","015.3","015.31","015.32","015.33","016","016.1","016.2","016.3","016.4","016.5","017","017.1","017.2","018","019","019.1","019.11","019.111","019.112","019.113","019.12","019.2","020","020","020","020.01","020.02","020.021","020.022","020.03","020.031","020.032","020.033","020.1","020.11","020.12","020.13","020.14","020.2","021","021.1","021.2","021.3","021.4","021.5","022","022.1","022.2","022.21","022.22","022.3","022.4","022.5","022.6","022.61","022.62","022.63","022.7","023","023.1","023.11","023.12","023.13","023.14","023.15","023.151","023.152","023.153","023.154","023.155","023.156","023.157","023.16","023.161","023.162","023.163","023.164","023.165","023.166","023.167","023.17","023.171","023.172","023.173","023.174","023.175","023.18","023.181","023.182","023.183","023.184","023.185","023.186","023.19","023.191","023.2","023.3","023.4","023.5","023.6","023.7","023.71","023.72","023.73","023.9","023.91","023.92","023.93","024","024","024.01","024.1","024.11","024.12","024.13","024.2","024.3","024.31","024.32","024.33","024.4","024.5","024.51","024.52","025","025.1","025.11","025.12","025.13","025.14","025.2","025.21","025.22","025.3","025.31","025.311","025.312","025.32","026","026","026.01","026.02","026.1","026.2","026.3","026.4","026.5","026.51","026.52","026.53","026.54","026.6","026.61","026.62","026.9","026.91","027","027.1","027.2","027.3","028","028.1","028.11","028.12","028.2","028.21","028.22","028.23","029","029.1","029.11","029.12","029.2","029.21","029.22","029.23","029.24","029.3","029.4","029.5","029.6","030","030","030.01","030.02","030.03","031","031.1","031.11","031.12","031.2","031.21","031.22","031.3","031.31","031.32","031.4","031.41","031.42","031.5","032","032","032.01","032.1","032.2","032.3","032.4","033","033.1","033.11","033.12","033.2","033.21","033.22","033.3","033.31","033.32","033.4","033.41","033.42","033.5","033.51","033.52","033.6","034","035","036","036","036.01","036.1","036.2","039","039.1","039.11","039.12","039.2","040","040","040.01","041","041.1","041.11","041.12","041.13","041.2","041.21","041.22","041.23","041.3","041.31","041.32","041.4","041.5","041.51","041.52","041.53","041.6","041.61","041.62","042","042.1","042.11","042.12","042.13","042.2","042.21","042.22","042.23","042.3","042.31","042.32","042.4","042.5","042.51","042.52","042.53","042.6","042.7","042.71","042.72","043","043.1","043.2","043.3","043.4","043.5","043.6","043.61","043.62","043.7","044","044.1","044.2","044.3","044.4","044.5","044.6","045","045","045.01","045.1","045.11","045.12","045.13","045.2","045.21","045.22","045.23","045.24","045.3","045.31","045.32","045.33","045.4","045.5","045.6","045.7","046","046.1","046.11","046.12","046.13","046.2","046.3","046.4","047","047","047.01","047.1","047.2","047.3","049","049.1","049.11","049.12","050","050","050.01","050.02","050.03","051","051.1","051.2","051.3","051.4","052","052.1","052.2","052.21","052.211","052.212","052.213","052.22","052.221","052.222","052.23","052.24","052.25","052.251","052.252","053","053","053.01","053.1","053.2","053.3","053.4","054","054.1","054.2","059","059.1","059.2","059.3","059.4","059.5","060","060","060.01","061","061","061.01","061.011","061.012","061.1","061.2","061.3","061.4","061.5","061.51","061.52","061.521","061.522","061.523","062","062.1","062.11","062.12","062.13","062.2","062.21","062.22","062.3","062.4","062.41","062.42","063","063.1","063.2","063.3","064","064","064.01","064.1","064.2","064.3","064.31","064.32","064.4","065","065.1","065.2","065.3","066","066.1","066.2","066.3","066.31","066.32","066.4","066.41","066.42","066.9","066.91","067","069","069.1","069.11","069.12","069.2","069.3","070","070","070.01","071","071.1","071.2","071.3","071.4","071.5","072","073","073.1","073.2","073.3","073.31","073.32","073.33","073.4","090","900","910","910","910.01","911","912","913","914","915","916","917","918","919","919.1","920","920","920.01","921","922","990","991","992"]
    var grupo: String=String()
    var palavra: String=String()
    
    @IBAction func buttonSearch(_ sender: Any) {
        
        grupo = String(editTextSearch.text!)
        grupo = grupo.replacingOccurrences(of: " ", with: "")
        grupo = grupo.replacingOccurrences(of: ",", with: ".")
        grupo = grupo.uppercased()
        
        if grupo==""{
            let alertController = UIAlertController(title: nil, message:
                "Nenhum símbolo digitado", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default,handler: nil))
            present(alertController, animated: true, completion: nil)
        }else{
            if !simbolosValidos.contains(grupo){
                let alertController = UIAlertController(title: nil, message:
                    "Símbolo não identificado", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default,handler: nil))
                present(alertController, animated: true, completion: nil)
            }else{
                self.performSegue(withIdentifier: "seguePesquisaToGrupos", sender: self)
            }
        }
    }
    
    
    @IBAction func buttonWord(_ sender: Any) {
        
        palavra = String(editTextWord.text!)
        palavra = palavra.replacingOccurrences(of: " ", with: "")
        palavra = palavra.uppercased()
        
        if palavra==""{
            let alertController = UIAlertController(title: nil, message:
                "Nenhuma palavra digitada", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default,handler: nil))
            present(alertController, animated: true, completion: nil)
        }else{
            self.performSegue(withIdentifier: "seguePesquisaToBusca", sender: self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Pesquisa")
        editTextSearch.keyboardType = .decimalPad

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true) // ao pressionar fora do teclado ele some
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier=="seguePesquisaToGrupos"{
            let tableViewControllerDestino = segue.destination as! GruposPesquisaTableViewController
            tableViewControllerDestino.grupo_buscado = grupo
            //print ("seguePesquisaToGrupos - "+String(grupo))
        }
        
        if segue.identifier=="seguePesquisaToBusca"{
            let tableViewControllerDestino = segue.destination as! BuscaPalavraTableViewController
            tableViewControllerDestino.palavra = palavra
            //print ("seguePesquisaToBusca - "+String(palavra))
        }

    }
    

}
