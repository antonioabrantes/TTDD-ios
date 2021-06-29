//
//  GPEquiv1TableViewController.swift
//  TTDD
//
//  Created by Macintosh HD on 16/03/20.
//  Copyright © 2020 Macintosh HD. All rights reserved.
//

import UIKit

struct DescricaoXmlGP1 {
    var id:Int
    var symbol1:String
    var assunto1:String
    var symbol2:String
    var assunto2:String
}

class GPEquiv1TableViewController: UITableViewController, XMLParserDelegate {

    var elementName: String = String()
    var descricao:[String]=[]
    var descricoes: [DescricaoXmlGP1]=[]
    var id:  Int=Int()
    var symbol1: String=String()
    var assunto1: String=String()
    var symbol2: String=String()
    var assunto2: String=String()

    var count_proximo: Int = 0
    var texto: String = ""
    var array_texto = [String]()
    var array_classes = [String]()
    var array_mensagem = [String]()
    var grupo_buscado: String=String()
    var pos: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        print("GPEquiv1"+grupo_buscado)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        if let path = Bundle.main.url(forResource: "codequi", withExtension: "xml"){
            if let parser = XMLParser(contentsOf: path){
                parser.delegate=self
                parser.parse()
            }
        }
        
        for _ in 1...100 { array_classes.append("") }
        for _ in 1...100 { array_mensagem.append("") }
        for _ in 1...100 { array_texto.append("") }

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // 1
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "row" {
            id = Int()
            symbol1 = String()
            assunto1 = String()
            symbol2 = String()
            assunto2 = String()
        }
        
        self.elementName = elementName
    }
    
    // 2
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "row" {
            let row = DescricaoXmlGP1(id: id, symbol1: symbol1, assunto1: assunto1, symbol2: symbol2, assunto2:assunto2)
            descricoes.append(row)
            //print("grupo_buscado"+grupo_buscado)
            if symbol1==grupo_buscado{
                array_classes.append(symbol2)
                array_mensagem.append(assunto2)
                texto = symbol2 + " " + assunto2
                array_texto.append(texto)
                pos = pos + 1
            }
        }
    }
    
    // 3
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if (!data.isEmpty) {
            if self.elementName == "id" {
                id = Int(data) ?? 0
            } else if self.elementName == "symbol1" {
                symbol1 += data
            } else if self.elementName == "assunto1" {
                assunto1 += data
            } else if self.elementName == "symbol2" {
                symbol2 += data
            } else if self.elementName == "assunto2" {
                assunto2 += data
            }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaReusoGP1", for: indexPath)

        // Configure the cell...
        let selecao1 = array_texto[indexPath.row]
        cell.textLabel?.text = selecao1 // célula padrão
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
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
        if segue.identifier=="segueGP1toGruposPesquisa"{
            if let indexPath=tableView.indexPathForSelectedRow {
                let tableViewControllerDestino = segue.destination as! GruposPesquisaTableViewController
                let grupo_buscado = array_classes[indexPath.row]
                tableViewControllerDestino.grupo_buscado = grupo_buscado
            }
        }
    }
    

}
