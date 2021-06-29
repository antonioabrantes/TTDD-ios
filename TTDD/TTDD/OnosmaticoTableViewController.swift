//
//  OnosmaticoTableViewController.swift
//  TTDD
//
//  Created by Macintosh HD on 31/10/19.
//  Copyright © 2019 Macintosh HD. All rights reserved.
//

import UIKit

class OnosmaticoTableViewController: UITableViewController {

    var array_proximo: [Int] = [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29]
    
    var descricao:[String]=["ABASTECIMENTO E MANUTENÇÃO DE VEÍCULOS - AFASTAMENTOS",
                            "ÁGUA E ESGOTAMENTO SANITÁRIO - Assembleias",
                            "ASSENTAMENTO FUNCIONAL - Aviso prévio",
                            "BAIXA - Bufê",
                            "CADASTRAMENTO DE FORNECEDORES - Ciclo de palestras",
                            "CIPA - COMUNICAÇÃO EXTERNA",
                            "COMUNICAÇÃO INTERNA - Contas bancárias",
                            "CONTAGEM E AVERBAÇÃO DE TEMPO DE SERVIÇO - Convite",
                            "Convites para eventos - Cursos promovidos por outros órgãos",
                            "DAÇÃO - DESPESA",
                            "DESPESA CORRENTE - Doenças ocupacionais",
                            "EDIÇÃO - Encontro",
                            "ENERGIA ELÉTRICA - Eventos",
                            "Falecimento de pessoal - Furto de veículos",
                            "Gabaritos de provas - Guia de transferência",
                            "HABILITAÇÃO - INCENTIVOS FUNCIONAIS",
                            "INDENIZAÇÃO - IRRF",
                            "Jardinagem - LOTAÇÃO",
                            "Manuais de usuário - Multas",
                            "Natalidade - Ouvidoria",
                            "PAD - Planejamento estratégico",
                            "PLANEJAMENTO INSTITUCIONAL - PROCRIAÇÃO",
                            "Procuração - Publicidade",
                            "Quinquênios - REEMBOLSO",
                            "REESTRUTURAÇÃO - Reportagens",
                            "Reposição salarial - Roubo de veículos",
                            "Saída de material - Suspensão",
                            "Tabela de temporalidade - VOTAÇÃO"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return descricao.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaReusoSumario", for: indexPath)

        let selecao = descricao[indexPath.row]
        cell.textLabel?.text=selecao
        
        // Configure the cell...
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
        if segue.identifier=="segueToOnosS"{
            if let indexPath=tableView.indexPathForSelectedRow {
                let tableViewControllerDestino = segue.destination as! OnosSTableViewController
                let proximo1 = array_proximo[indexPath.row]
                tableViewControllerDestino.proxima_tela = proximo1
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
