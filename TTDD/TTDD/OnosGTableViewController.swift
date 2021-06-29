//
//  OnosGTableViewController.swift
//  TTDD
//
//  Created by Macintosh HD on 10/11/19.
//  Copyright © 2019 Macintosh HD. All rights reserved.
//

import UIKit

struct DescricaoXmlOnosG {
    var id:Int
    var grupo:String
    var kind:String
    var assunto:String
    var subassunto:String
    var indice:Int
    var proximo:Int
}

class OnosGTableViewController: UITableViewController, XMLParserDelegate {

    var elementName: String = String()
    var descricao:[String]=[]
    var descricoes: [DescricaoXmlOnosG]=[]
    //var elementName: String=String()
    var id:  Int=Int()
    var grupo: String=String()
    var kind: String=String()
    var assunto: String=String()
    var subassunto: String=String()
    var indice: Int=Int()
    var proximo: Int=Int()
    var str: String=String()
    var proxima_tela: Int = 0
    var count_proximo: Int = 0
    var contador: Int = 0
    var texto: String = ""
    var array_texto = [String]()
    var array_proximo = [Int]()
    var array_classes = [String]()
    var item_selecionado: Int = 0
    var coluna_selecionada: Int = 0
    var grupo_buscado: String=String()
    var proximo_buscado: Int=Int()
    
    var widthsp: Float=Float()
    var bordas: Float=Float()
    var largura_caracter: Float=Float()
    var intervalo: Int=Int()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let path = Bundle.main.url(forResource: "onosmatico", withExtension: "xml"){
            if let parser = XMLParser(contentsOf: path){
                parser.delegate=self
                parser.parse()
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    // 1
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "row" {
            id = Int()
            grupo = String()
            kind = String()
            assunto = String()
            subassunto = String()
            indice = Int()
            proximo = Int()
        }
        
        self.elementName = elementName
    }
    
    // 2
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "row" {
            let row = DescricaoXmlOnosG(id: id, grupo:grupo, kind: kind, assunto:assunto, subassunto:subassunto, indice:indice,proximo:proximo)
            descricoes.append(row)
            if indice==proxima_tela{
                array_proximo.append(proximo)
                array_classes.append(grupo)
                
                let densidade = UIScreen.main.scale
                let width = self.view.frame.size.width
                widthsp = Float(( width / 1.0 ))
                bordas = 0.0
                largura_caracter = 10.0
                intervalo = Int(((widthsp - bordas)/largura_caracter) + 1)
                print("width= ")
                print(width)
                print("densidade= ")
                print(densidade)
                print("widthspG= "+String(widthsp)+" intervalo= "+String(intervalo))
                
                contador = intervalo - (assunto.count + grupo.count)
                if (contador<1) {
                    if (widthsp>320) {
                        contador = 20
                    } else {
                        contador = 12
                    }
                }

                str = "."
                for _ in 1...contador {
                    str = str + "."
                }
                
                /*if grupo == "" {
                    texto = assunto + " ver " + subassunto
                } else {
                    texto = assunto + str + grupo
                }*/
                if grupo == "" && proximo == 0{
                    texto = assunto + " ver " + subassunto
                } else if grupo == "" && proximo > 0{
                    texto = assunto
                } else {
                    texto = assunto + str + grupo
                }

                array_texto.append(texto)
                count_proximo = count_proximo + 1
            }
        }
    }
    
    // 3
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if (!data.isEmpty) {
            if self.elementName == "id" {
                id = Int(data) ?? 0
            } else if self.elementName == "grupo" {
                grupo += data
            } else if self.elementName == "kind" {
                kind += data
            } else if self.elementName == "assunto" {
                assunto += data
            } else if self.elementName == "subassunto" {
                subassunto += data
            } else if self.elementName == "indice" {
                indice = Int(data) ?? 0
            } else if self.elementName == "proximo" {
                proximo = Int(data) ?? 0
            }
            //print("entrei"+self.elementName+assunto)
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array_texto.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaReusoOnosG", for: indexPath)

        // Configure the cell...
        let selecao1 = array_texto[indexPath.row]
        cell.textLabel?.text = selecao1
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.textLabel?.font = UIFont(name:"Courier", size:14)
        
        // Configure the cell...

        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier=="segueToOnosZ"{
            if let indexPath=tableView.indexPathForSelectedRow {
                let grupo = array_classes[indexPath.row]
                if (grupo == ""){
                    let tableViewControllerDestino = segue.destination as! OnosZTableViewController
                    let proximo1 = array_proximo[indexPath.row]
                    print("prepare segueToOnosG "+String(proximo1))
                    tableViewControllerDestino.proxima_tela = proximo1
                }
            }
        }
        if segue.identifier=="segueGToGruposPesquisa"{
            if let indexPath=tableView.indexPathForSelectedRow {
                let tableViewControllerDestino = segue.destination as! GruposPesquisaTableViewController
                let proximo1 = array_proximo[indexPath.row]
                let grupo_buscado = array_classes[indexPath.row]
                tableViewControllerDestino.grupo_buscado = grupo_buscado

                print("prepare segueGToGruposPesquisa "+String(proximo1))
                tableViewControllerDestino.proxima_tela = proximo1
            }
        }

    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var proximo1 = 1
        var grupo1 = ""
        if let indexPath=tableView.indexPathForSelectedRow {
            item_selecionado = indexPath.row
            proximo1 = array_proximo[item_selecionado]
            grupo1 = array_classes[item_selecionado]
            
            print("entrei no shouldPerform "+String(proximo1)+"-"+String(grupo1)+"-")
        }
        if (proximo1==0 && grupo1==""){
            let alertController = UIAlertController(title: nil, message:
                "Não há subníveis para esta palavra", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default,handler: nil))
            
            present(alertController, animated: true, completion: nil)
            tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
            return false
        } else {
            
            if grupo1 != ""{
                print("performsegue suspenso "+String(grupo1))
                self.performSegue(withIdentifier: "segueGToGruposPesquisa", sender: self)
                return false
            }
            return true
        }
    }

    

}
