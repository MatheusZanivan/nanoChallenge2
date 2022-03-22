//
//  ViewController.swift
//  Challenger2
//
//  Created by Vinicius Gomes on 21/03/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource  {
    
    
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    var models: [(title: String, note: String, autor: String, categoria: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        table.delegate = self
        table.dataSource = self
        title = "Estante"
        
    }
    // filter
    
    @IBAction func Filter(_ sender: UISegmentedControl) {
        
    }
    
    
    // Ao tocar no botao faça/
    @IBAction func didTapNewNote(){
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? EntryViewController else {
            return
        }
        vc.title = "Nova Leitura"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { noteTitle, note, autor, categoria in
            self.navigationController?.popViewController(animated: true)
            self.models.append((title: noteTitle ,note: note, autor: autor, categoria: categoria ))
            self.label.isHidden = true
            self.table.isHidden = false
            
            self.table.reloadData()
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    // Table
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = models[indexPath.row]
        
        // Show note controller
        guard let vc = storyboard?.instantiateViewController(identifier: "note")     as? NoteViewController else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = model.title
        vc.Title = model.title
        vc.Note = model.note
        vc.Autor = model.autor
        vc.Categoria = model.categoria
        navigationController?.pushViewController(vc,animated: true)
        
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        models.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    

}

