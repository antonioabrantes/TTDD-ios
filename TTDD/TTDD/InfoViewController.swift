//
//  InfoViewController.swift
//  TTDD
//
//  Created by Macintosh HD on 06/12/19.
//  Copyright © 2019 Macintosh HD. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    
    @IBOutlet weak var ajuda: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ajuda.text = "Guia do Usuário: o TTDD meio (Tabela de Temporalidade e Destinação de Documentos) é um aplicativo que possibilita a navegação pelo esquema de temporalidade e pelo índice remissivo com recursos de busca. Para visualizar a tela de entrada com as funções do aplicativo selecione a função Casa que aparece no menu superior. O primeiro item da tela de entrada permite navegar pelo Código de Classificação. Você pode navegar pelas classes, subclasses, grupos e subgrupos podendo retornar à tela anterior clicando na primeira opção da lista de seleção.\n\n Para ver a temporalidade da opção desejada basta manter a sua seleção por dois segundos, ou seja, ao invés de um clique simples de seleção procure prolongar uma pouco mais nesta mesma opção para o que o aplicativo possa mostrar na próxima tela as informações de temporalidade.\n\n Na tela de temporalidade o usuário dispõe de um botão para ver a Nota Explicativa respectiva daquele código.\n\n Escolha a lupa do menu principal ou na tela de entrada para procurar por uma classificação ou por uma palavra específica no campo Assunto da tabela de temporalidade independentemente do índice remissivo. Para visualização do índice remissivo  basta selecionar o único A que aparece no menu superior ou na tela de entrada.\n\n No índice remissivo sempre que uma palavra chave tiver a indicação à direita de uma classificação, ao clicar nesta opção você será levado à classificação selecionada. Caso não haja nenhuma classificação à direita após um tracejado, então você ao clicar nesta opção, deve ser levado ao próximo nível da hierarquia.\n\n Na busca de equivalência na tela principal você pode realizar uma busca por código na tabela atual (Portaria n° 47/2020 do Arquivo Nacional) partindo do código antigo segundo a Resolução n° 14/2001 do Conarq (revogada). O usuário pode fazer a busca no sentido inverso também: a partir do código da tabela atual saber qual o equivalente na tabela antiga, segundo a tabela de Equivalência divulgada pelo Arquivo Nacional. \n\n Na tela de entrada você dispõe de acesso a tabela de equivalência completa onde ao clicar num código selecionado você será levado para a tela que mostra o código novo."

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
