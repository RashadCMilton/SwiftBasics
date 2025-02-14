//
//  TodoStruct.swift
//  DesignPatternIOS
//
//  Created by Rashad Milton on 2/12/25.
//

import Foundation

struct Todo:Decodable {
    let userId:Int
    let id:Int
    let title:String
    let completed:Bool
}
