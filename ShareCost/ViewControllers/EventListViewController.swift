//
//  EventListViewController.swift
//  ShareCost
//
//  Created by Wenbin Chen on 7/12/19.
//  Copyright © 2019 share-cost-project. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var avatarButton: UIButton!
    @IBOutlet weak var eventTable: UITableView!
    
    var demoEvent : [Event] {
        let event1 = Event.init(host: userSession.shared.getCurrentUser()!, summary: "asdf wer asdf zxv sdfwqe rxcvfd dasff wer qwet qerqer", title: "White Mountain Hiking")
        event1.category = "Hiking"
        event1.profileImage = "white_mountain"
        let event2 = Event.init(host: userSession.shared.getCurrentUser()!, summary: "asdf wer asdf zxv sdfwqe rxcvfd dasff wer qwet qerqer", title: "Six Flag Field Trip")
        event2.category = "Theme Park"
        event2.profileImage = "six_flag"
        return [event1, event2]
    }
    
    var avatarImage = UIImage(named:"avatar_icon_placeholder")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My Events"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addNewEvent))
        setupAvatarView()
        eventTable.delegate = self
        eventTable.dataSource = self
        eventTable.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let navcontroller = self.navigationController as? CustomNavigationBarViewController {
            navcontroller.setupTranslucent()
        }
    }
    
    @objc func addNewEvent() {
        
    }
    
    func setupAvatarView() {
        avatarButton.layer.cornerRadius = avatarButton.bounds.size.width / 2
        avatarButton.clipsToBounds = true
        avatarButton.setImage(avatarImage, for: .normal)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoEvent.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventListCell", for: indexPath) as! EventTableViewCell
        cell.separatorInset = UIEdgeInsets.zero
        cell.eventTitle.text = demoEvent[indexPath.item].title
        cell.eventSummary.text = demoEvent[indexPath.item].summary
        cell.eventCategory.image = getCategoryFrom(name: demoEvent[indexPath.item].category!)
        cell.eventImage.image = getEventImagefrom(name: demoEvent[indexPath.item].profileImage!)
        return cell
    }
    
    func getCategoryFrom(name: String) -> UIImage? {
        if (name == "Hiking") {
            return UIImage(named: "hiking_icon")
        } else {
            return UIImage(named: "park_icon")
        }
    }
    
    func getEventImagefrom(name: String) -> UIImage? {
        return UIImage(named: name)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EventDetailPage", sender: demoEvent[indexPath.item])
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EventDetailPage", let vc = segue.destination as? EventDetailViewController, let send = sender as? Event {
            vc.currentPostId = send.identifier
        }
    }
}
