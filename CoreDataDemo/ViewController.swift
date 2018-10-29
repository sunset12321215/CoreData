//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by mac on 10/29/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    //  Tạo context: Nơi chứa các Thực Thể
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func addData()      //  Hàm thêm dữ liệu
    {
        //  Tạo 1 thực thể                                            tên là Device trong context
        //  Entity Description: Mô tả đối tượng
        guard let entity_Device = NSEntityDescription.entity(forEntityName: "Device", in: context) else {
            fatalError("Entity Fail")
        }
        
        for i in 1...10
        {
            //  Tạo biến đại diện cho đối tượng "device", trong Thực thể device có thuộc tính là "name"
            //             Managed Object: Đối tượng được quản lý
            let device = NSManagedObject(entity: entity_Device, insertInto: context)
            device.setValue("STT \(i)", forKey: "name")     //  gán dữ liệu cho thuộc tính "name"
        }
    }
    
    func fetchData()    //  Hàm lấy dữ liệu
    {
        //  Tạo request để lấy dữ liệu trong Device
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Device")
        
        //  Lấy ra mảng kết quả
        let results = try! context.fetch(fetchRequest) as! [NSManagedObject]
        
        for item in results //  In mảng kết quả ra
        {
            print(item.value(forKey: "name") as! String)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addData()
        fetchData()
        
    }
}

