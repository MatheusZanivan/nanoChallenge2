//
//  NoteViewController.swift
//  Challenger2
//
//  Created by Vinicius Gomes on 21/03/22.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!
    @IBOutlet var autorLabel: UILabel!
    @IBOutlet var categoriaLabel: UILabel!
    
    public var completion: ((String) -> Void)?
    
    public var Title: String = ""
    public var Note: String = ""
    public var Autor: String = ""
    public var Categoria: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = Title
        noteLabel.text = Note
        autorLabel.text = Autor
        categoriaLabel.text = Categoria
//        //titleField.becomeFirstResponder()
//         navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(didTapSave))
    }
    

    
}
