//
//  ContactsListViewController.swift
//  ContactList
//
//  Created by Vladimir Khalin on 27.11.2022.
//

import UIKit

protocol ContactsListViewControllerDeligate {
    func personsDeligate(_ persons: [Person])
}

class ContactsListViewController: UITableViewController {
    
    let contactList = Person.getContacts()
    //var delegate: ContactsListViewControllerDeligate!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  delegate?.personsDeligate(contactList)
        
    }

    // MARK: - Table view data source
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "fullContactsList", sender: contactList)
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactList.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let currenContact = contactList[indexPath.row]
        content.text = currenContact.fullName
        cell.contentConfiguration = content
        return cell
    }
 
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let personDetailVC = segue.destination as? PersonDetailsViewController else { return }

        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        personDetailVC.personDetails = contactList[indexPath.row]
        
    }
}
