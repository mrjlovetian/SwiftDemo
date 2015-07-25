//
//  ViewController.swift
//  DatePiceDemo
//
//  Created by zxl on 15/7/25.
//  Copyright (c) 2015年 Mrj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    //懒加载加载uitableview
    lazy var myTable: UITableView? = {
        let view = UITableView(frame: CGRectMake(0, 64, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height - 64), style: UITableViewStyle.Plain)
        
            view.dataSource = self
            view.delegate = self
        
        return view
    }()
    
    //懒加载加载日期
    lazy var datePick1: UIDatePicker? = {
       let view = UIDatePicker()
        view.locale = NSLocale(localeIdentifier: "zh-CN")
        view.datePickerMode = UIDatePickerMode.Date
        view.minimumDate = NSDate()
        return view
    }()
    
    lazy var persons:[Person]? = {
//       let p = Person()
//        p.name = "zhangsan"
//        p.age = 18
//        
//        let p1 = Person()
//        p1.name = "lisi"
//        p1.age = 15
        
        let per = [Person(name: "小红君1", age: 18, sex: "男", content: "我县h说考虑换大号啊就耍大牌啊啊开始就更好滴啊我县hi小等哈说考虑换大号啊就耍大牌啊啊开始就更好滴啊大牌啊啊开始就更好滴啊大牌啊啊开始就更好滴啊"), Person(name: "小红君3", age: 18, sex: "男", content: "我县hi小等哈说考虑换大大牌啊啊开始就更好滴啊"), Person(name: "小红君", age: 18, sex: "男", content: "我县hi小等哈说考啊就耍大牌啊啊开始就更好滴啊"), Person(name: "小红君2", age: 18, sex: "男", content: "我县hi小等哈说考虑换大号啊就耍大始就更好滴啊"), Person(name: "小红君4", age: 18, sex: "男", content: "我县hi小等哈说考虑换大红君5号啊就耍大牌啊啊开始就更好滴啊"), Person(name: "小红君5", age: 18, sex: "男", content: "我县hi小等哈说考虑换大号啊就耍大牌啊啊开始就更好滴啊"), Person(name: "小红君6", age: 18, sex: "男", content: "我县hi小等哈说考虑换大号啊就耍大牌啊啊开始就更好滴啊红君5"), Person(name: "小红君7", age: 18, sex: "男", content: "我县hi小等哈说考虑换大号啊就耍大牌啊啊开始就更好滴啊大牌啊啊开始就更好滴啊大牌啊啊开始就更好滴啊")]
        
        return per
    }()
    
    var ischange: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        
        //加载uitableview
        self.view.addSubview(myTable!)
        
        //加载日期选择器
//        self.view.addSubview(datePick1!)
        
        

    }
    
    //改变我的背景图片
    func changeMyBackIm(){
        let back1 = UIImageView(frame: self.view.bounds)
        back1.image = UIImage(named: "bg_01")
        self.view.addSubview(back1)
        
        let back2 = UIImageView(frame: self.view.bounds)
        back2.image = UIImage(named: "bg_02")
        back2.tag = 9527
        self.view.addSubview(back2)
        
        
        //创建定时器
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "changeBack", userInfo: nil, repeats: true)
    }
    
    //动画改变背景图片
    func changeBack(){
        let temV = self.view.viewWithTag(9527)
        if (ischange == true)
        {
            UIView.animateWithDuration(1, animations: { () -> Void in
                temV?.alpha = 1.0
            })
            ischange = false
        }else
        {
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                temV?.alpha = 0.0
            })
            ischange = true
        }
    }
    
    //创建选择日期选择器
    func creteDatePickView()
    {
        let datePick = UIDatePicker()
        datePick.locale = NSLocale(localeIdentifier: "zh-CN")
        datePick.datePickerMode = UIDatePickerMode.Date
        datePick.minimumDate = NSDate()
        datePick.addTarget(self, action: "changeValue:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(datePick)
    }
    
    func changeValue(nowvalue: UIDatePicker)
    {
        println("\(nowvalue.date)")
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return persons!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as? MyTableViewCell
        if cell == nil{
            cell = MyTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        }
//        cell?.textLabel?.text = self.persons![indexPath.row].name
        cell!.per = self.persons![indexPath.row]
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
// MARK: delegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 128
    }

}

