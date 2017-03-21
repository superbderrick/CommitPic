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
