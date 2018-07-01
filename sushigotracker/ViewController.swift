//
//  ViewController.swift
//  sushigotracker
//
//  Created by Justin on 6/29/18.
//  Copyright © 2018 Justin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var newPlayerInput: UITextField!
    private var data: [Player] = [Player("Justin")]

    @IBOutlet weak var PlayersTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PlayersTable.dataSource = self;
        PlayersTable.delegate = self;

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "player") as! PlayerTableViewCell

        cell.setPlayer(data[indexPath.row])
        
  
        //cell.textLabel?.text = text //3.
        
        return cell //4.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onAddPlayer(_ sender: Any, forEvent event: UIEvent) {
        if let playerName = newPlayerInput.text {
            let insertIndex = self.data.count
            PlayersTable.beginUpdates()
            self.data.insert(Player(playerName),at:insertIndex);
            PlayersTable.insertRows(at: [IndexPath(row:insertIndex,section:0)], with: .top)
            PlayersTable.endUpdates()
            newPlayerInput.text = ""
        }
    }

}

struct Player{
    let name: String
    var score: Int = 0
    init(_ name:String) {
        self.name = name;
    }
}



