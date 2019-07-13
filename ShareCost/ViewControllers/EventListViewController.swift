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
    
    var demoEvent = [["title" : "White Mountain Hiking",
                      "category": "Hiking",
                      "profileImage" : "white_mountain",
                      "host" : "Jack",
                      "summary" : "asdf wer asdf zxv sdfwqe rxcvfd dasff wer qwet qerqer"],
                     ["title" : "Six Flag Field Trip",
                      "category": "Theme Park",
                      "profileImage" : "six_flag",
                      "host" : "Evan",
                      "summary" : "asdf wer asdf zxv sdfwqe rxcvfd dasff wer qwet qerqer"]]
    
    var avatarImage = UIImage(named:"avatar_icon_placeholder")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = ""
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
//        let px = 1 / UIScreen.main.scale
//        let frame = CGRect(x: 0, y: 0, width: self.eventTable.frame.size.width, height: px)
//        let line = UIView(frame: frame)
//        self.eventTable.tableHeaderView = line
//        line.backgroundColor = self.eventTable.separatorColor
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
        cell.eventTitle.text = demoEvent[indexPath.item]["title"]
        cell.eventHost.text = demoEvent[indexPath.item]["host"]
        cell.eventSummary.text = demoEvent[indexPath.item]["summary"]
        cell.eventCategory.image = getCategoryFrom(name: demoEvent[indexPath.item]["category"]!)
        cell.eventImage.image = getEventImagefrom(name: demoEvent[indexPath.item]["profileImage"]!)
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
}
