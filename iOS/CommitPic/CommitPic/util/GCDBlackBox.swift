//
//  GCDBlackBox.swift
//  CommitPic
//
//  Created by derrick on 2017. 3. 21..
//  Copyright © 2017년 Superbderrick. All rights reserved.
//

import UIKit

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
	DispatchQueue.main.async {
		updates()
	}
}

public func generateState(withLength len : Int) -> String {
	let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	let length = UInt32(letters.characters.count)
	
	var randomString = ""
	for _ in 0..<len {
		let rand = arc4random_uniform(length)
		let idx = letters.index(letters.startIndex, offsetBy: Int(rand))
		let letter = letters.characters[idx]
		randomString += String(letter)
	}
	return randomString
}
