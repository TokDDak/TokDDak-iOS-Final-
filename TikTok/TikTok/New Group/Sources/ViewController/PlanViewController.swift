//
//  PlanViewController.swift
//  TikTok
//
//  Created by IJ . on 2019/12/30.
//  Copyright © 2019 김준성. All rights reserved.
//

import UIKit
import MobileCoreServices

class PlanViewController: UIViewController {
    @IBOutlet var dayLabels: [UILabel]!
    @IBOutlet var amountLabels: [UILabel]!
    @IBOutlet var tableViews: [UITableView]!
    @IBOutlet weak var roundView: UIView!
    
    
    var leftItems = [String](repeating: "Left", count: 20)
    var rightItems = [String](repeating: "Right", count: 20)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViews.forEach {
            $0.register(UINib(nibName: "PlanItemCell", bundle: nil), forCellReuseIdentifier: "PlanItemCell")
            $0.dataSource = self
            $0.delegate = self
            $0.dropDelegate = self
            $0.dragDelegate = self
            $0.dragInteractionEnabled = true
            
        }
        
        
        UIGraphicsBeginImageContext(self.roundView.frame.size)
           UIImage(named: "imgRound")?.draw(in: self.roundView.bounds)
           let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
           UIGraphicsEndImageContext()
           self.roundView.backgroundColor = UIColor(patternImage: image)
        
//        self.roundView.backgroundColor = UIColor(patternImage: UIImage(named:"imgRound")!)
        
    }
    
    
    @IBAction private func touchUpLeftButton(_ sender: UIButton) {
        
    }
    
    @IBAction private func touchUpRightButton(_ sender: UIButton) {
        
    }
    
    func tableView(_ tableView: UITableView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
        [] // 임시 func 추가
    }
    
    
    
    
}

extension PlanViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanItemCell", for: indexPath)
        
        if tableView == tableViews[0] {
            cell.textLabel?.text = leftItems[indexPath.row]
        }
        if tableView == tableViews[1]{
            cell.textLabel?.text = rightItems[indexPath.row]
        }
        
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == tableViews[0] {
            return leftItems.count
        }
        if tableView == tableViews[1]{
            return rightItems.count
        }
        
            return 5
    }
}

extension PlanViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension PlanViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        if tableView == tableViews[0] {
            let string = leftItems[indexPath.row]
            
        }
        if tableView == tableViews[1] {
            let string = rightItems[indexPath.row]
            
        }
        if tableView == tableViews[2] {
            let string = rightItems[indexPath.row]
            
        }
        
        
       // guard let data = String.data(using: .utf8) else { return [] }
        
     
        
//
//        let itemProvider = NSItemProvider(item: data as NSData, typeIdentifier: kUTTypePlainText as String)
//
//        return [UIDragItem(itemProvider: itemProvider)]
        
        return []
    }
    
    
}

extension PlanViewController: UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        
        let destinationIndexPath: IndexPath
        
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            let section = tableView.numberOfSections - 1
            let row = tableView.numberOfRows(inSection: section)
            destinationIndexPath = IndexPath(row: row, section: section)
        }
        
        coordinator.session.loadObjects(ofClass: NSString.self) { items in
            // convert the item provider array to a string array or bail out
            guard let strings = items as? [String] else { return }
            
            // create an empty array to track rows we've copied
            var indexPaths = [IndexPath]()
            
            // loop over all the strings we received
            for (index, string) in strings.enumerated() {
                // create an index path for this new row, moving it down depending on how many we've already inserted
                let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
                
                // insert the copy into the correct array
                if tableView == self.tableViews[0] {
                    self.leftItems.insert(string, at: indexPath.row)
                } else {
                    self.rightItems.insert(string, at: indexPath.row)
                }
                
                // keep track of this new row
                indexPaths.append(indexPath)
            }
            
            // insert them all into the table view at once
            tableView.insertRows(at: indexPaths, with: .automatic)
        }
        
    }
    
    
}
