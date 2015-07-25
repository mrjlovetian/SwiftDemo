//
//  MyTableViewCell.swift
//  DatePiceDemo
//
//  Created by zxl on 15/7/25.
//  Copyright (c) 2015年 Mrj. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    //相当于是重写set方法， didSet
    var per: Person?  {
        didSet {
            self.nameLb?.text = per?.name
            self.sexLb?.text = per?.sex
//            self.ageLb?.text = per?.age
            self.contentLb?.text = per?.content
            var attubtString = NSMutableAttributedString(string: per!.content!, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(15), NSForegroundColorAttributeName:UIColor.redColor()])
        
            //字体样式大小，用来自适应高度
            var str: NSString = per!.content!
            var rec = str.boundingRectWithSize(CGSizeMake(self.frame.width - 20, 0), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(15)], context: nil)
            self.contentLb?.frame = CGRectMake(10, 78, self.frame.width - 20, rec.size.height)
        }
    }
    
    var nameLb:UILabel?
    var sexLb:UILabel?
    var ageLb:UILabel?
    var contentLb:UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
   
    super.init(style: style, reuseIdentifier: reuseIdentifier)
     self.initUI()
    }

   required init(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
    //设置相关的位置大小
    func initUI(){
        nameLb = UILabel(frame: CGRectMake(10, 5, 200, 30))
        self.addSubview(nameLb!)
        
        sexLb = UILabel(frame: CGRectMake(221, 5, 50, 30))
        self.addSubview(sexLb!)
        
        ageLb = UILabel(frame: CGRectMake(10, 35, 30, 30))
        self.addSubview(ageLb!)
        
        contentLb = UILabel(frame: CGRectMake(10, 78, self.frame.size.width - 20, 30))
        contentLb?.numberOfLines = 0
        contentLb?.font = UIFont.systemFontOfSize(15)
        self.addSubview(contentLb!)
    }
}
