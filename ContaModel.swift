//
//  ContaModel.swift
//  ProjetoFinal
//
//  Created by Turma01-21 on 05/02/24.
//

import Foundation

struct Conta : Hashable, Decodable,Encodable{
    var _id : String?
    var _rev : String?
    var nome: String
    var valor : Float
    var data : String
    var paga : Bool
    var type: String

}

//struct Conta :  Encodable, Identifiable{
//    var id : Int
//    var contaAgua : contaAgua
//    var contaOutros : contaOutros
//    var contaNet : contaNet
//    var contaLuz : contaLuz
//
//
//}
//
//struct contaAgua : Encodable{
//    var nome: String
//    var valorAgua : Float
//    var data : String
//    var paga : Bool
//
//}
//struct contaLuz : Encodable{
//    var nome: String
//    var valorLuz : Float
//    var data : String
//    var paga : Bool
//
//}
//struct contaNet : Encodable{
//    var nome: String
//    var valorNet : Float
//    var data : String
//    var paga : Bool
//
//}
//struct contaOutros : Encodable{
//    var nome: String
//    var valorOutros : Float
//    var data : String
//    var paga : Bool
//
//}

