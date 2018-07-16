//
//  MainClassViewController.swift
//  RXPractice
//
//  Created by huyunlong on 2017/12/27.
//  Copyright © 2017年 huyunlong. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Action
import RxDataSources

class MainClassViewController: UIViewController {

    var mainTopView:MainClassTopView!
    var tableView:UITableView!
    var viewModel = MainClassViewModel()
    let disposeBag = DisposeBag()
    
//MARK: -- lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.addView()
       self.initTableViewData()
       self.initData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

//MARK: -- private

    func initData(){
        
        self.view.backgroundColor = UIColor.white
        
        //=================================== mainTopView ===========
        
        //内购 Action  -- RX订阅
        mainTopView.purchaseBtn.rx.tap .subscribe(onNext:{ _ in
            
            
        }).disposed(by: self.disposeBag)
    
        //Action -- RX action 传值
        mainTopView.myworkAction.elements.subscribe(onNext:{ _ in

            
        }).disposed(by: self.disposeBag)
        
        tableView .register(MainClassTableViewCell.self , forCellReuseIdentifier: "MainClassTableViewCell")
        
        
       //加载网络
        viewModel.networkError.asObservable()
            .subscribe( onNext:{ error in
            
                print(error)
            }
        ).disposed(by: self.disposeBag)
        
        viewModel.getClassListWithMapObject()

    }
    
    //初始化和tableView相关的数据
    func initTableViewData(){
        
        //cell

        viewModel.dataSource.bind(to: tableView.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainClassTableViewCell", for: IndexPath(row: row, section: 0)) as! MainClassTableViewCell
            
            cell.setModel(model: element)
            // configure cell
            return cell
            }
            .disposed(by: disposeBag)
        
        //tableview select
        tableView.rx
            .modelSelected(MainClassModelMapObject_sub.self)
            .subscribe(onNext:{ model in
            
                print(model)
        }).disposed(by: self.disposeBag)
        
        // delegate
        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }

    //MARK: -- addView
    func addView(){
        
        //topview
        self.mainTopView = MainClassTopView.init(frame: CGRect(x: 0, y: 0 , width: SCREEN_W ,height: 98))
        self.view.addSubview(self.mainTopView)
        
        //tableview
        self.tableView = UITableView.init(frame: CGRect(x: 0, y: 98, width:SCREEN_W  ,height:SCREEN_H - 98 ), style: .plain);
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.separatorStyle = .none
        self.view.addSubview(self.tableView)
    }
}

extension MainClassViewController : UITableViewDelegate{

    func tableView(_ tableView: UITableView, heightForRowAt IndexPat : IndexPath) -> CGFloat
    {
        let cellModel = self.viewModel.dataSource.value[IndexPat.row]
        print("count = ",self.viewModel.dataSource.value.count,"name = ",cellModel.name ?? "","index == ",IndexPat.row)
        return 216
    }
    
}










