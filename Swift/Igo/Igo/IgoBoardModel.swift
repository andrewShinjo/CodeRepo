//
//  IgoBoardModel.swift
//  Igo
//
//  Created by Andrew Shinjo on 6/20/26.
//

enum Stone {
	case black, white
}

struct IgoBoardModel {
	let size: Int
	var grid: [[Stone?]]
	
	init(size: Int = 19) {
		self.size = size
		self.grid = Array(
			repeating: Array(repeating: nil, count: size),
			count: size
		)
	}
}
