//
//  DetailVC.swift
//  Contacts
//
//  Created by Hoàng Minh Thành on 9/9/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    var person = Person()
    var labelName = UILabel()
    var labelmobile = UILabel()
    var labelPhone = UILabel()
    var message = UIImageView()
    var call = UIImageView()
    var contact = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        // Tên danh bạ
        self.labelName.frame = CGRectMake(110,130,300,50)
        self.labelName.font = UIFont.boldSystemFontOfSize(25)
        self.labelName.text = person.lastName + " " + person.firstName
        

        self.contact.image = UIImage(named: "contact")
        self.contact.frame = CGRectMake(10,100,100,100)
        
        // Text mobile
        self.labelmobile.frame = CGRectMake(30, 200, 300, 50)
        self.labelmobile.font = UIFont.boldSystemFontOfSize(15)
        self.labelmobile.text = "mobile"
        self.labelmobile.textColor = UIColor.blueColor()
        
        //Số điện thoại
        self.labelPhone.frame = CGRectMake(30, 220, 300, 50)
        self.labelPhone.font = UIFont.boldSystemFontOfSize(15)
        self.labelPhone.text = person.phoneNumber
        
        //Ảnh message
        self.message.image = UIImage(named: "message")
        self.message.frame = CGRectMake(280,230,20,20)
        
        //Ảnh call
        self.call.image = UIImage(named: "call")
        self.call.frame = CGRectMake(320,230,20,20)
        
        
        self.view.addSubview(call)
        self.view.addSubview(message)
        self.view.addSubview(contact)
        self.view.addSubview(labelPhone)
        self.view.addSubview(labelmobile)
        self.view.addSubview(self.labelName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
