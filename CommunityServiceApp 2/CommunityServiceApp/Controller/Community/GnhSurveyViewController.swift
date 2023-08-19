//
//  GnhSurveyViewController.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/06/30.
//

import UIKit

class GnhSurveyViewController: UIViewController {
    
    // MARK: - data
    
    private let socialQuestions = [GnhHealthQuestions.question1, GnhHealthQuestions.question2, GnhHealthQuestions.question3,
                                   GnhHealthQuestions.question4, GnhHealthQuestions.question5, GnhHealthQuestions.question6,
                                   GnhHealthQuestions.question7, GnhHealthQuestions.question8, GnhHealthQuestions.question9]
    
    private lazy var datas: [GnhSurveyModel] = [
        GnhSurveyModel(title: "環境", questions: socialQuestions),
        GnhSurveyModel(title: "経済", questions: socialQuestions),
        GnhSurveyModel(title: "社会", questions: socialQuestions),
        GnhSurveyModel(title: "健康", questions: socialQuestions),
        GnhSurveyModel(title: "教育", questions: socialQuestions),
        GnhSurveyModel(title: "文化", questions: socialQuestions),
        GnhSurveyModel(title: "余暇", questions: socialQuestions),
        GnhSurveyModel(title: "政治", questions: socialQuestions),
        GnhSurveyModel(title: "メンタル", questions: socialQuestions),
    ]
    
    // MARK: - property
    
    private let identifier = "identifier"
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        tv.dataSource = self
        tv.delegate = self
        tv.register(GnhSurveyCell.self, forCellReuseIdentifier: identifier)
        tv.tableHeaderView = titleLabel
        tv.tableFooterView = getDoneButton()
        return tv
    }()
    
    private lazy var titleLabel: UILabel = {
        let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 80)
        let label = UILabel(frame: frame)
        label.font = .zenKakuBold(size: 24)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.text = "GNHアンケート"
        return label
    }()
    
    // MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor,
                         left: view.leftAnchor,
                         bottom: view.safeAreaLayoutGuide.bottomAnchor,
                         right: view.rightAnchor,
                         paddingTop: -100)
    }
    
    // MARK: - helper
    
    func getDoneButton() -> UIView {
        let viewHeight: CGFloat = 100
        let buttonWidth: CGFloat = 150
        let buttonHeight: CGFloat = 50
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: viewHeight))
        
        let button = UIButton(frame: CGRect(x: (view.frame.width - buttonWidth) / 2,
                                            y: (viewHeight - buttonHeight) / 2,
                                            width: buttonWidth,
                                            height: buttonHeight))
        
        button.titleLabel?.font = .zenKakuBold(size: 17)
        button.setTitle("完了", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .earthPurpleBlue
        button.layer.cornerRadius = buttonHeight / 2
        
        view.addSubview(button)
        
        return view
    }
}

// MARK: - UITableViewDataSource

extension GnhSurveyViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = datas[section]
        
        if section.isOpen {
            return section.questions.count + 1
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! GnhSurveyCell
        cell.delegate = self
        cell.selectionStyle = .none
        let data = datas[indexPath.section]
        
        if indexPath.row == 0 {
            cell.surveyViewModel = GnhSurveyViewModel(question: data.title,
                                                      row: indexPath.row,
                                                      isOpen: data.isOpen)
        } else {
            cell.contentView.isUserInteractionEnabled = false
            cell.surveyViewModel = GnhSurveyViewModel(question:data.questions[indexPath.row - 1],
                                                      row: indexPath.row,
                                                      isOpen: data.isOpen)
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension GnhSurveyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            datas[indexPath.section].isOpen = !datas[indexPath.section].isOpen
            tableView.reloadSections([indexPath.section], with: .none)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 60 : 80
    }
}

// MARK: - GnhSurveyCellDelegate

extension GnhSurveyViewController: GnhSurveyCellDelegate {
    func didChangeSwitchValue() {
        let controller = RobotChatViewController(nibName: nil, bundle: nil, idGnh: true)
        controller.modalPresentationStyle = .fullScreen
        navigationController?.present(controller, animated: true)
    }
}
