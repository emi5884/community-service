//
//  TestProfileModelData.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/04/18.
//

import Foundation
import UIKit

let testModels = ProfileModel(header: header,
                              project: [projectModel],
                              learning: [learningModel1],
                              certification: [certificationModel],
                              volunteer: [volunteerModel],
                              skill: [skillModel],
                              assistanceActivity: [assistanceModel1],
                              count: 7)

private let header = Header(icon: #imageLiteral(resourceName: "member11"),
                            background: #imageLiteral(resourceName: "Fuji_2"),
                            name: "佐藤文子",
                            membership: "蔵児市")

private let selfIntroduce = "自己紹介テストテストテストテストテストテストテストテスト"

private let activity = ActivityInfo(icon: #imageLiteral(resourceName: "Mt.Fuji"),
                                    content: "テストテストテストテスト",
                                    like: 3)

private let projectContent = "「冬に花火を打ち上げて地域を盛り上げたい」という青年のアイデアから始まったプロジェクト。\n初年度の開催では2200万円の支援金と2万5000人の来場者を集め、全国紙に「六府市の奇策」と掲載されるなど反響を集める。\n2025年まで冬の風物詩として発展を続け、以降は行政への引き継ぎを目指しています。"

private let projectModel: StandardInfo = StandardInfo(icon: #imageLiteral(resourceName: "firework"),
                                                      title: "クリスマス花火ファンタジア",
                                                      subTitle: "地域振興協会",
                                                      period: "2014年〜",
                                                      content: projectContent)

private let learningModel1: StandardInfo = StandardInfo(icon: #imageLiteral(resourceName: "univ_icon"),
                                                       title: "国際関係学",
                                                       subTitle: "武蔵野地域大学",
                                                       period: "2018年〜2020年",
                                                       content: "")

private let learningModel2: StandardInfo = StandardInfo(icon: #imageLiteral(resourceName: "internet_icon"),
                                                        title: "Go言語",
                                                        subTitle: "ウェブ広告会社",
                                                        period: "2018年〜2021年",
                                                        content: "")

private let certificationModel: StandardInfo = StandardInfo(icon: #imageLiteral(resourceName: "univ_icon"),
                                                            title: "国際関係学",
                                                            subTitle: "学位記",
                                                            period: "2020年",
                                                            content: "")

private let volunteerModel: StandardInfo = StandardInfo(icon: #imageLiteral(resourceName: "international_icon"),
                                                        title: "日本語学習サポート",
                                                        subTitle: "国際交流協会",
                                                        period: "2016年〜",
                                                        content: "")

private let skillModel = SkillInfo(title: "日本語学習サポート",
                                   refereeIcon: #imageLiteral(resourceName: "international_icon"),
                                   referee: "推薦者：国際交流協会")

private let interest = InterestInfo(icon: #imageLiteral(resourceName: "Mt.Fuji"),
                                    name: "興味タイトル",
                                    follower: "興味テストテストテスト")

private let recommendation = RecommendationInfo(icon: #imageLiteral(resourceName: "Mt.Fuji"),
                                                title: "推薦タイトル",
                                                content: "推薦テストテストテスト")

private let assistanceModel1 = StandardInfo(icon: #imageLiteral(resourceName: "dog2_icon"),
                                           title: "動物愛護",
                                           subTitle: "殺処分対象犬の保護、譲渡活用等",
                                           period: "2015年〜",
                                           content: "")

private let assistanceModel2 = StandardInfo(icon: #imageLiteral(resourceName: "plant_icon"),
                                           title: "サステナブルポリマー株式会社",
                                           subTitle: "水不足問題の解決",
                                           period: "2018年〜",
                                           content: "")

//let award = AwardInfo(title: "受賞タイトル",
//                      subTitle: "受賞サブタイトル",
//                      content: "受賞テストテストテスト")
