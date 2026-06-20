//
//  IgoBoard.swift
//  Igo
//
//  Created by Andrew Shinjo on 6/20/26.
//

import SwiftUI

struct IgoBoard: View {
	
	let BOARD_COLOR: Color = Color(
		red: 0.85,
		green: 0.70,
		blue: 0.50
	)
	let LINE_COLOR: Color = Color.black
	let LINE_WIDTH: CGFloat = 1
	let ROWS: Int = 19
	
	var body: some View {
		Canvas { context, size in
			context.fill(
				Path(CGRect(origin: .zero, size: size)),
				with: .color(BOARD_COLOR)
			)
			
			let y: CGFloat = 20
			let step = (size.width - 40) / CGFloat(ROWS - 1)
			
			for i in 0...ROWS-1 {
				var linePath = Path()
				let x = CGFloat(i) * step + 20 + 0.5
				
				linePath.move(to: CGPoint(x: x, y: y))
				linePath.addLine(
					to: CGPoint(x: x, y: size.height - 20)
				)
				context.stroke(
					linePath,
					with: .color(LINE_COLOR),
					lineWidth: LINE_WIDTH
				)
			}
			
			for i in 0...ROWS-1 {
				var linePath = Path()
				let y = CGFloat(i) * step + 20 + 0.5
				linePath.move(to: CGPoint(x: 20, y: y))
				linePath.addLine(
					to: CGPoint(x: size.height - 20, y: y)
				)
				context.stroke(
					linePath,
					with: .color(LINE_COLOR),
					lineWidth: LINE_WIDTH
				)
			}
		}
		.aspectRatio(1, contentMode: .fit)
	}
}

#Preview {
	IgoBoard()
}
