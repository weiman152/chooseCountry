//
//  ChooseCountryController.swift
//  chooseCountry
//
//  Created by iOS on 2018/2/26.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class ChooseCountryController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var dataArray: [CountryModel] = []
    var sectionArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化
        
        
        //1.判断当前系统选择的是哪种语言
        
        //2.在source-AllCountry文件夹中选择对应的语言文件
        
        //3.取出txt文件中的内容取出,转成model
        chooseTxtContent()
        //4.取出section的title
        getSectionTitles()
        
        //5.给当前的table赋值
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func chooseTxtContent() -> Void {
        guard
            let url = Bundle.main.url(
                forResource: "source/AllCountry/zh_Hans_CNCountry",
                withExtension: "txt") else {
            return
        }
        
        struct DataModel: Codable {
            let data: [CountryModel]?
        }
        
        do {
            let data = try Data(contentsOf: url)
            let model = try JSONDecoder().decode(DataModel.self, from: data)
            dataArray = model.data ?? []
        } catch {
            print(error)
        }
    }
    
    //取出section的title
    func getSectionTitles() -> Void {
        var temp: [String] = dataArray.flatMap({
            return String($0.countryCode?.first ?? Character(""))
        })
        temp = Array(Set(temp))
        temp = temp.sorted(by: { return $0 < $1 })
        sectionArray = temp
    }
    
    @IBAction func backClick(_ sender: UIButton) {
        dismiss(animated: true) {}
        
    }
    
    //UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChooseCountryCell().initCell(tableView: tableView,indexPath:indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArray[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionArray
    }
    
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
