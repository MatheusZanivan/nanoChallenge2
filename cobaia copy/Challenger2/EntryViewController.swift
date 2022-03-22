//
//  EntryViewController.swift
//  Challenger2
//
//  Created by Vinicius Gomes on 21/03/22.
//

import UIKit

class EntryViewController: UIViewController {

    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
    @IBOutlet var autorField: UITextField!
    @IBOutlet var categoriaField: UITextField!
    
    public var completion: ((String, String, String, String) -> Void)?
            
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteField.layer.cornerRadius = 6
        noteField.layer.borderWidth = 1
        noteField.layer.borderColor = UIColor.systemGray6.cgColor
        titleField.backgroundColor = .white
        titleField.becomeFirstResponder()
         navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(didTapSave))
    }
    @objc func didTapSave() {
        if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty,!autorField.text!.isEmpty, !categoriaField.text!.isEmpty{
            completion?(text, noteField.text, autorField.text!,categoriaField.text!)
        }
    }
    
}
