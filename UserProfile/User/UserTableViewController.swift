//
//  UserTableViewController.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 13.11.2021.
//

import UIKit


class UserTableViewController: UITableViewController {
    @IBOutlet weak var imageField: UIImageView!
    
    var model: UserViewModel = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try self.model.updateUser()
            self.tableView.reloadData()
        } catch UserError.invalidURL {
            print("Invalid URL")
        } catch {
            print(error)
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return model.sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  model.sections[section].item.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model.sections[section].title
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = self.model.sections[indexPath.section]
        
        let item = section.item[indexPath.row]
        
        switch item {
        case .image(image: let image):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath)
            
            if let imageCell = cell as? ImageTableViewCell {
                imageCell.photoField.image = image
            }
            
            return cell
        case .item(let item):
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
            cell.textLabel?.text = item.title
            cell.detailTextLabel?.text = item.value
            return cell
        }

    }
    
}

