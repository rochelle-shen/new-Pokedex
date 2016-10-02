//
//  ViewController.swift
//  Modified Pokedex
//
//  Created by Rochelle on 10/1/16.
//  Copyright © 2016 Rochelle. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var allTheElements: UICollectionView!
    
    @IBOutlet weak var topNav: UINavigationItem!
    
    var pokemonArray: [Pokemon] = PokemonGenerator.getPokemonArray()
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "Pokedex"))
    var fontElements: [UIColor] = [UIColor.white, UIColor.white, UIColor.white, UIColor.black, UIColor.white, UIColor.white, UIColor.white, UIColor.black, UIColor.white, UIColor.white, UIColor.black, UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.white]
    var imageElements: [UIImage] = [#imageLiteral(resourceName: "bug"), #imageLiteral(resourceName: "dark"), #imageLiteral(resourceName: "dragon"), #imageLiteral(resourceName: "electric"), #imageLiteral(resourceName: "fairy"), #imageLiteral(resourceName: "fighting"), #imageLiteral(resourceName: "fire"), #imageLiteral(resourceName: "flying"), #imageLiteral(resourceName: "ghost"), #imageLiteral(resourceName: "grass"), #imageLiteral(resourceName: "ground"), #imageLiteral(resourceName: "ice"), #imageLiteral(resourceName: "normal"), #imageLiteral(resourceName: "poison"), #imageLiteral(resourceName: "psychic"), #imageLiteral(resourceName: "rock"), #imageLiteral(resourceName: "steel"), #imageLiteral(resourceName: "water")]
    var diffElements: [String] = ["Bug", "Dark", "Dragon", "Electric", "Fairy", "Fighting", "Fire", "Flying", "Ghost", "Grass", "Ground", "Ice", "Normal", "Poison", "Psychic", "Rock", "Steel", "Water"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        allTheElements.delegate = self
        allTheElements.dataSource = self
        topNav.titleView = imageView
        allTheElements.backgroundColor = UIColor(red:0.99, green:0.95, blue:0.78, alpha:1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Display the buttons of different element type of Pokemon
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diffElements.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let eachCell = collectionView.dequeueReusableCell(withReuseIdentifier: "eachElement", for: indexPath) as! ElementsCollectionViewCell
        eachCell.element.setBackgroundImage(imageElements[indexPath.item], for: .normal)
        eachCell.element.setTitle(diffElements[indexPath.item], for: .normal)
        eachCell.element.setTitleColor(fontElements[indexPath.item], for: .normal)
        return eachCell
    }
    
    //Return 20 Random Pokemon array
    func giveRandomPokemon() -> [Pokemon] {
        var randomPoke: [Pokemon] = []
        for _ in 0...19 {
            let randomNum = arc4random_uniform(UInt32(pokemonArray.count))
            randomPoke.append(pokemonArray[Int(randomNum)])
        }
        return randomPoke
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromRandom" {
            let destinationVC = segue.destination as! DisplayViewController
            destinationVC.numOfPokemon = giveRandomPokemon()
        }
    }
    
    

}
