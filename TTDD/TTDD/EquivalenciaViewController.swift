//
//  EquivalenciaViewController.swift
//  TTDD
//
//  Created by Macintosh HD on 17/03/20.
//  Copyright © 2020 Macintosh HD. All rights reserved.
//

import UIKit
import WebKit

class EquivalenciaViewController: UIViewController,WKScriptMessageHandler {
    
    var grupo_buscado: String=String()
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("chegou mensagem do javascript ")
        print(message.body)
        print(message.name)
        let dict = message.body as? NSDictionary;
        let str = dict?["command"] as? String
        print(str ?? "")
        grupo_buscado = str!
        self.performSegue(withIdentifier: "segueEquivatoGruposPesquisa", sender: self)
        
        //let str:String = message.body as! String
        //print(str)
        /*
        struct Registro: Codable {
            var command: String
        }
        //let dado = message.body
        let json = """
{
    "command": "Durian"
}
""".data(using: .utf8)!
        do {
            let dados =  try JSONDecoder().decode(Registro.self,from:(json))
            print(dados.command)
        }catch {
            print("erro \(error)")
        }*/

        /*let dados = message.body as! String
            do{
                if let objetoJSON = try JSONSerialization.jsonObject(with: dados) as? [String: Any] {
                    //print (objetoJSON)
                    if let leitura = objetoJSON["command"] as? [String: Any]{
                        print ("leitura = "+String(leitura))
                    }
                }
            } catch {
                print ("Erro ao ler arquivo JSON")
            }*/
        

        //struct Registro: Codable {
        //    let command: String
        //}
        //let dado = try? JSONDecoder().decode(Registro.self,from:message.body as! Data)
        //print(dado ?? "erro")
    }

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add Webkit.framework no projeto
        
        /*let url = "https://www.google.com"
        let request = URLRequest(url: URL(string: url)!)
        self.webView.load(request)
        self.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)*/
        
        /*let url = Bundle.main.url(forResource: "ttdd", withExtension: "html")!
        webView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        webView.load(request)
        self.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)*/
        
        let path = Bundle.main.path(forResource: "ttdd",ofType:"html") ?? ""
        let url = NSURL(fileURLWithPath: path)
        let request = NSURLRequest(url:url as URL)
        let theConfiguration = WKWebViewConfiguration()
        theConfiguration.userContentController.add(self,name:"interOp")
        let theWebView = WKWebView(frame:self.view.frame,configuration:theConfiguration)
        theWebView.load(request as URLRequest)
        self.view.addSubview(theWebView)
        
        
        
        

        //webView.uiDelegate = self
        //webView.navigationDelegate = self
/*
         self.webView.evaluateJavaScript("updateLocation(10)") { result, error in
         guard error == nil else {
         print(error ?? "default")
         return
         }
         
         https://stackoverflow.com/questions/39322904/how-to-return-value-from-webview-evaluatejavascript-callback
         
         
        if let url1 = Bundle.main.url(forResource: "ttdd", withExtension: "html"){
            if let htmlData = try? Data(contentsOf: url1){
                let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
                webView.load(htmlData, mimeType: "text/html", characterEncodingName: "UTF-8", baseURL: baseURL)
            }
        }
         */
        

        // Do any additional setup after loading the view.
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading"{
            if webView.isLoading{
                activityIndicator.startAnimating()
                activityIndicator.isHidden = false
            } else {
                activityIndicator.stopAnimating()
                activityIndicator.isHidden = true
            }
        }
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier=="segueEquivatoGruposPesquisa"{
            let tableViewControllerDestino = segue.destination as! GruposPesquisaTableViewController
            tableViewControllerDestino.grupo_buscado = grupo_buscado
        }
    }
    

}
