//
//  CloseButton.swift
//  TagListViewDemo
//
//  Created by Benjamin Wu on 2/11/16.
//  Copyright © 2016 Ela. All rights reserved.
//

import UIKit

internal class CloseButton: UIButton {

    var iconSize: CGFloat = 10
    var lineWidth: CGFloat = 1
    var lineColor: UIColor = UIColor.white.withAlphaComponent(0.54)
    var selectedLineColor: UIColor = UIColor.white
    var normalLineColor: UIColor = UIColor.red

    weak var tagView: TagView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//
//    private func setupView() {
//        self.setRemove(normalLineColor, for: .normal)
//        self.setRemove(selectedLineColor, for: .selected)
//    }
    
    private func setRemove(_ color: UIColor, for state: UIControl.State){
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        UIGraphicsPushContext(context)
        UIGraphicsBeginImageContext(CGSize(width: iconSize, height: iconSize))

        let path = UIBezierPath()

        path.lineWidth = lineWidth
        path.lineCapStyle = .round

        let iconFrame = CGRect(
            x: 0,
            y: 0,
            width: iconSize,
            height: iconSize
        )

        path.move(to: iconFrame.origin)
        path.addLine(to: CGPoint(x: iconFrame.maxX, y: iconFrame.maxY))
        path.move(to: CGPoint(x: iconFrame.maxX, y: iconFrame.minY))
        path.addLine(to: CGPoint(x: iconFrame.minX, y: iconFrame.maxY))

        color.setStroke()
        path.stroke()
        
        context.addPath(path.cgPath)
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            self.setImage(image, for: state)
        }
        UIGraphicsPopContext()
        UIGraphicsEndImageContext()
    }

    override func draw(_ rect: CGRect) {
        self.setRemove(normalLineColor, for: .normal)
        self.setRemove(selectedLineColor, for: .selected)
    }

}
