//
//  DetailViewController.swift
//  CalculateProbabilityApp
//
//  Created by Ashish Shah on 27/01/23.
//

import UIKit


public enum CombinationType {
    case unique, all
}

open class DetailViewController: UIViewController {
    
    //MARK: - Outlets and Variables
    @IBOutlet weak var numberOfCombinations: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    public var textFieldStrings: [String] = []
    
    var combinations: [[String]] = []
    
    public var combinationType: CombinationType = .all
    
    var com = Combinations() 
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        var temp:[[[String]]] = []
        
        switch combinationType {
        case .all:
            for i in 1...textFieldStrings.count {
                temp.append(com.getCombinations(array: textFieldStrings, length: i))
            }
        case .unique:
            for i in 1...textFieldStrings.count {
                temp.append(com.getUniqueCombinations(array: textFieldStrings, length: i))
            }
        }
        
        combinations = temp.flatMap({ $0 })
        numberOfCombinations.text = "Total Number of Combinations are: \(combinations.count)"
        
    }
    
}

//MARK: - TableView DataSource
extension DetailViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        combinations.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let combinations = combinations[indexPath.row]
        
        let combinationString = combinations.reduce("") { "\($1)    " + $0 }
        
        cell.textLabel?.text = combinationString
        
        return cell
    }
        
}
