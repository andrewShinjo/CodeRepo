//
//  IgoBoard.swift
//  Igo
//
//  Created by Andrew Shinjo on 6/20/26.
//

import SwiftUI

struct IgoBoard: View {
	
	@State private var mouseLocation: CGPoint = .zero
	@State private var isHovering = false
	
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
			
			// Draw vertical lines.
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
			
			// Draw horizontal lines.
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
			
			// Draw star points
			for i in [3, 9, 15] {
				for j in [3, 9, 15] {
					
					let dotRect = CGRect(
						x: CGFloat(i) * step + 16,
						y: CGFloat(j) * step + 16,
						width: 9,
						height: 9
					)
					
					context.fill(
						Path(ellipseIn: dotRect),
						with: .color(.black)
					)
				}
			}
			
			// Draw ghost piece
			
			if isHovering {
				let step = (size.width - 40) / CGFloat(ROWS - 1)
				let col = Int(round((mouseLocation.x - 20) / step))
				let row = Int(round((mouseLocation.y - 20) / step))
				
				if (0..<ROWS).contains(col) && (0..<ROWS).contains(row) {
						let centerX = CGFloat(col) * step + 20.5
						let centerY = CGFloat(row) * step + 20.5
						let radius: CGFloat = step * 0.45
						
						let stoneRect = CGRect(
							x: centerX - radius,
							y: centerY - radius,
							width: radius * 2,
							height: radius * 2
						)
						context.fill(
							Path(ellipseIn: stoneRect),
							with: .color(.black.opacity(0.5))
						)
				}
			}
		}
		.aspectRatio(1, contentMode: .fit)
		.onContinuousHover { phase in
			
			switch phase {
			case .active(let location):
				mouseLocation = location
				isHovering = true
				print("Moving at \(location)")
			case .ended:
				isHovering = false
				mouseLocation = .zero
			}
		}
	}
}

#Preview {
	IgoBoard()
}
