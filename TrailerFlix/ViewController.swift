//
//  ViewController.swift
//  TrailerFlix
//
//  Created by Lucas Santana Brito on 02/11/19.
//  Copyright © 2019 lsb.br. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trailersTableView: UITableView!
    
    var trailers: [Trailer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadtrailers()
    }
    
    func loadtrailers() {
        guard let url = Bundle.main.url(forResource: "trailers", withExtension: "json") else { return }
        do {
            let trailersData = try Data(contentsOf: url)
            trailers = try JSONDecoder().decode([Trailer].self, from: trailersData)
            trailersTableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func showTrailer(index: Int) {
        let trailer = trailers[index]
        performSegue(withIdentifier: "showTrailer", sender: trailer)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let trailerVC = segue.destination as? TrailerViewController else { return }
        trailerVC.trailer = sender as? Trailer
    }

    @IBAction func watchRandomTrailer(_ sender: UIButton) {
        let randomIndex = Int(arc4random_uniform(UInt32(trailers.count)))
        showTrailer(index: randomIndex)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trailers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTrailer = tableView.dequeueReusableCell(withIdentifier: "cellTrailer", for: indexPath)
        
        let trailer = trailers[indexPath.row]
        
        cellTrailer.textLabel?.text = trailer.title
        cellTrailer.detailTextLabel?.text = "\(trailer.year)"
        cellTrailer.imageView?.image = UIImage(named: "\(trailer.poster)")
        return cellTrailer
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        showTrailer(index: index)
    }
    
    
}
