//
//  ViewController.swift
//  Challenger2
//
//  Created by Vinicius Gomes on 21/03/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate ,UITableViewDataSource  {
    
    struct Livro{
        var autor: String
        var title: String
        var note: String
        var categoria: String
        var status: UIColor
    }
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
//    @IBOutlet var viewCell: UIView!
//    @IBOutlet var labelTitulo: UILabel!
//    @IBOutlet var labelAutor: UILabel!
//    @IBOutlet var labelGenero: UILabel!
//    @IBOutlet var veiwStatus: UIView!
//
//    var models: [(title: String, note: String, autor: String, categoria: String)] = []
    var models: [Livro] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "customTableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "customTableViewCell")
        table.delegate = self
        table.dataSource = self
        title = "Estante"
        
        
        
    }
    // filter
    
    
    func sortBasedOnSegmentPressed(){
        switch segmentControl.selectedSegmentIndex{
        case 0:
            ordemTodos()
        case 1:
            ordemAutor()
        case 2:
            ordemCategoria()
        case 3:
            ordemStatus()
        default: print("erro")
        }
    }
    
    @IBAction func Filter(_ sender: UISegmentedControl) {
        sortBasedOnSegmentPressed()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
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
//            self.models.append((title: noteTitle ,note: note, autor: autor, categoria: categoria ))
            self.models.append(Livro(autor: autor, title: noteTitle, note: note, categoria: categoria, status: .green))
            self.label.isHidden = true
            self.table.isHidden = false
            self.table.reloadData()
            
        }
        ordemTodos()
        navigationController?.pushViewController(vc, animated: true)
    }
    // Table
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as! customTableViewCell
        
        cell.labelNome.text = models[indexPath.row].title
        cell.labelAutor.text = models[indexPath.row].autor
        cell.labelCategoria.text = models[indexPath.row].categoria
        cell.statusImage.backgroundColor = .green
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
//    tableViewBord
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        models.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    func ordemTodos(){
        models.sort { $0.title < $1.title }
        table.reloadData()
    }
    func ordemAutor(){
        models.sort { $0.autor < $1.autor }
        table.reloadData()
    }
    func ordemCategoria(){
        models.sort { $0.categoria < $1.categoria }
        table.reloadData()
    }
    func ordemStatus(){
        
    }
    


}

