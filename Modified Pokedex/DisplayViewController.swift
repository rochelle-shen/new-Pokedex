//
//  ListViewController.swift
//  Modified Pokedex
//
//  Created by Rochelle on 10/1/16.
//  Copyright © 2016 Rochelle. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var numOfPokemon: [Pokemon] = []
    var currentPokemon: Pokemon!
    var pokemonArray: [Pokemon] = PokemonGenerator.getPokemonArray()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var gridView: UICollectionView!
    
    
    
    @IBOutlet weak var switcher: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        gridView.delegate = self
        gridView.dataSource = self
        gridView.isHidden = true
        view.addSubview(gridView)
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokeCell", for: indexPath) as! DisplayPokemonTableViewCell
        cell.awakeFromNib()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numOfPokemon.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! DisplayPokemonTableViewCell
        cell.pokeLabel.text = numOfPokemon[indexPath.item].name
        if let url = NSURL(string: numOfPokemon[indexPath.item].imageUrl) {
            if let data = NSData(contentsOf: url as URL) {
                cell.eachPokeImage.image = UIImage(data: data as Data)
            }
        }
        cell.eachPokeImage.contentMode = UIViewContentMode.scaleAspectFit
        cell.pokemonNum.text = String(numOfPokemon[indexPath.item].number)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfPokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let square = gridView.dequeueReusableCell(withReuseIdentifier: "gridCell", for: indexPath) as! GridCollectionViewCell
        square.awakeFromNib()
        return square
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as! GridCollectionViewCell
        cell.gridName.text = numOfPokemon[indexPath.item].name
        cell.gridNum.text = String(numOfPokemon[indexPath.item].number)
        if let url = NSURL(string: numOfPokemon[indexPath.item].imageUrl) {
            if let data = NSData(contentsOf: url as URL) {
                cell.gridImage.image = UIImage(data: data as Data)
            }
        }
        cell.gridImage.contentMode = UIViewContentMode.scaleAspectFit
    }
    
    
    @IBAction func switchViews(_ sender: AnyObject) {
        if switcher.selectedSegmentIndex == 0 {
            tableView.isHidden = false
            gridView.isHidden = true
        }
        if switcher.selectedSegmentIndex == 1 {
            tableView.isHidden = true
            gridView.isHidden = false
        }
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
