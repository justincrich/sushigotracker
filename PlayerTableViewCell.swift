//
//  PlayerTableViewCell.swift
//  sushigotracker
//
//  Created by Justin on 6/30/18.
//  Copyright © 2018 Justin. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    @IBOutlet weak var score: UITextField!
    @IBOutlet weak var playerName: UILabel!
    private var player: Player
    

    public init(style: UITableViewCellStyle, reuseIdentifier: String?,player initPlayer:Player){
        self.player = initPlayer
        super.init(style: style,reuseIdentifier:reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder ) {
        self.player = Player("")
        super.init(coder: aDecoder)
        
    }
    
    func setPlayer(_ player:Player){
        self.player = player
        playerName.text = player.name
        score.text = String(player.score)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func plusTen(_ sender: Any) {
        print("plusTen")
        let currentScore = math(score:score.text ?? "0",change:10, player:self.player)
        score.text = currentScore
    }
    @IBAction func plusOne(_ sender: Any) {
        let currentScore = math(score:score.text ?? "0",change:1, player:self.player)
        score.text = currentScore
    }
    @IBAction func plusFive(_ sender: Any) {
        let currentScore = math(score:score.text ?? "0",change:5, player:self.player)
        score.text = currentScore
    }
    @IBAction func minusOne(_ sender: Any) {
        let currentScore = math(score:score.text ?? "0",change:-1, player:self.player)
        score.text = currentScore
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func math(score:String,change:Int,player:Player)->String{
        if let parsedScore = Int(score){
            self.player.score = parsedScore + change
        }
        return String(self.player.score)
    }
    
}
