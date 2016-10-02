//
//  DisplayPokemonTableViewCell.swift
//  Modified Pokedex
//
//  Created by Rochelle on 10/1/16.
//  Copyright © 2016 Rochelle. All rights reserved.
//

import UIKit

class DisplayPokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonNum: UILabel!
    @IBOutlet weak var eachPokeImage: UIImageView!
    @IBOutlet weak var pokeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
