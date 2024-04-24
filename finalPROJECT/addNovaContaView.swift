//
//  addNovaContaView.swift
//  projetofim
//
//  Created by Turma01-21 on 06/02/24.
//

import SwiftUI

struct addNovaContaView: View {
    @StateObject var vm = ViewModel()
    @State var contas:[Conta]?
    
    @State var nome: String = ""
    @State var data: String = ""
    @State var valor: Float = 0.0
    @State var type: String = ""
    @State var newItem: Conta = Conta( nome: "", valor: 0.0, data: "", paga: false, type: "")
    
    @Environment(\.dismiss) var dismiss
    
    let select = ["Mercado","Água","Internet","Outros"]
    var body: some View {
        NavigationStack{
        VStack{
            HStack{
                Image("logo")
                
            }
            .frame(width:390).background(.white)
            
            Spacer()
            VStack(spacing: 10){
                HStack{
                    TextField("Nome", text: $nome) .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    TextField("Data", text: $data) .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                TextField("Valor", value: $valor, format: .number) .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Picker("Tipo", selection: $type){
                    ForEach(select,id:\.self){
                        Text($0)
                    }
                } .padding()
                    .frame(width: 230)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .accentColor(.black)
                
            }.multilineTextAlignment(.center)
            Spacer()
            
            
            Button("Adicionar") {
                if(type==""){
                    return
                }
                newItem = Conta(nome: nome, valor: valor, data: data, paga: false, type: type)
                
                vm.post(newItem)
                
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                
                nome = ""
                data = ""
                valor = 0.0
                type = ""
                
                
                dismiss()
//                NavigationLink(destination: contasAPagarView()){
//                    Text("adicionar")
//                }
                
            }.padding().frame(width: 200,height: 50).background(Color("Cor1")).fontWeight(.bold).foregroundColor(Color.white).cornerRadius(6)
            
            Spacer()
        }.background(Color("fundo"))
            
        }
            
        }
}
    


struct addNovaContaView_Previews: PreviewProvider {
    static var previews: some View {
        addNovaContaView()
    }
}
