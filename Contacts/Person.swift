//
//  Person.swift
//  Contacts
//
//  Created by Hoàng Minh Thành on 9/9/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import Foundation

class Person {
    static var arrFirstNameMen:[String]!
    static var arrFirstNameWomen:[String]!
    static var arrLastName:[String]!
    static var arrMiddleNameMen:[String]!
    static var arrMiddleNameWomen:[String]!
    
    var fullName:String!
    var lastName:String!
    var firstName:String!
    var middleName:String!
    var phoneNumber:String!
    static var isCheck:Bool = true
    init()
    {
        if Person.isCheck == true {
            Person.arrFirstNameMen = ["Anh","Bắc","Biên","Chung","Chiến","Chính","Công","Dương","Dũng","Đạo","Điển","Đạt","Kiên","Kiểm","Long","Mạnh","Nam","Nhân","Phúc","Phước","Phú","Quảng","Quân","Sáng","Trung","Tú","Cần","Minh","Phương","Thế","Duy","Cường","Huy","Thắng","Tiến","Tùng","Bình"]
            Person.arrFirstNameWomen = ["An","Anh","Ánh","Chung","Dung","Giang","Hằng","Hương","Khánh","Liên","Linh","Liễu","Mai","Nhi","Nhung","Oanh","Phúc","Quyên","Quỳnh","Thuỷ","Thảo","Tú","Phương","Hoa","Huệ","Uyên","Xinh","Yến"]
            Person.arrMiddleNameMen = ["Văn","Đăng","Bảo","Đình","Minh","Vĩnh","Hữu","Công","Khắc","Duy","Kim","Thế","Xuân"]
            Person.arrMiddleNameWomen = ["Thị","Ngọc","Thuỳ"]
            Person.arrLastName = ["Hoàng","Trần","Nguyễn","Đặng","Phạm","Trịnh","Đỗ","Đinh","Lê","Vũ","Bùi","Hồ","Ngô","Dương","Lý","Lương","Doãn"]
            Person.isCheck = false
        }
        
        let genderIndex = Int(arc4random_uniform(2))
        if genderIndex == 0
        {
            middleName = Person.arrMiddleNameWomen[Int(arc4random_uniform(UInt32(Person.arrMiddleNameWomen.count)))]
            firstName = Person.arrFirstNameWomen[Int(arc4random_uniform(UInt32(Person.arrFirstNameWomen.count)))]
        }
        else
        {
            middleName = Person.arrMiddleNameMen[Int(arc4random_uniform(UInt32(Person.arrMiddleNameMen.count)))]
            firstName = Person.arrFirstNameMen[Int(arc4random_uniform(UInt32(Person.arrFirstNameMen.count)))]
        }
        lastName = Person.arrLastName[Int(arc4random_uniform(UInt32(Person.arrLastName.count)))]
        fullName = lastName + " " + middleName + " " + firstName
        var randomNumber = ""
        let lower : UInt32 = 10000000
        let upper : UInt32 = 99999999
        randomNumber = "09\(String(Int(arc4random_uniform(upper - lower) + lower)))"
        phoneNumber = randomNumber
    }
    func randomPhone() -> String {
        var randomNumber = ""
        let lower : UInt32 = 10000000
        let upper : UInt32 = 99999999
        randomNumber = "09\(String(Int(arc4random_uniform(upper - lower) + lower)))"
        return randomNumber
    }
}