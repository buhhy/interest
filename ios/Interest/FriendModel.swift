//
//  FriendModel.swift
//  Interest
//
//  Created by Terry Lei on 1/18/16.
//  Copyright © 2016 None. All rights reserved.
//

import Foundation

class FBFriend {
	let uid: Int64;
    let imgUrl: String;
	let name: String;

    init(uid: Int64, imgUrl: String, name: String) {
    	self.uid = uid;
        self.imgUrl = imgUrl;
        self.name = name;
    }
}