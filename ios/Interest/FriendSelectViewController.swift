//
//  FriendSelectViewController.swift
//  Interest
//
//  Created by Terry Lei on 1/18/16.
//  Copyright © 2016 None. All rights reserved.
//

import Foundation
import UIKit

class FriendSelectViewController: UIViewController {

    @IBOutlet weak var friendListTableView: FriendListTableView!

//    var dataSource: FriendListDataSource = nil;

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }

    override func viewDidLoad() {
        super.viewDidLoad();
    }
}

class FriendListTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    private let items: [FBFriend] = [
        FBFriend(uid: 0, imgUrl: "", name: "Bob"),
        FBFriend(uid: 1, imgUrl: "", name: "Joe"),
        FBFriend(uid: 2, imgUrl: "", name: "Anne"),
        FBFriend(uid: 3, imgUrl: "", name: "Mike"),
        FBFriend(uid: 4, imgUrl: "", name: "Josh")
    ];

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style);
        self.dataSource = self;
        self.delegate = self;
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        self.dataSource = self;
        self.delegate = self;
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! FriendListItemView;

        cell.name.text = items[indexPath.row].name;

        if (cell.selected == true) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }

        return cell;
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath);
        cell!.accessoryType = UITableViewCellAccessoryType.Checkmark;
    }

    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath);
        cell!.accessoryType = UITableViewCellAccessoryType.None;
    }
}

class FriendListItemView: UITableViewCell {
    @IBOutlet weak var profileIcon: UIImageView!
    @IBOutlet weak var name: UILabel!
}
