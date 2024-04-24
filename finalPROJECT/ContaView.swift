//
//  ContaView.swift
//  ProjetoFinal
//
//  Created by Turma01-21 on 05/02/24.
//

import SwiftUI
import Charts

//var contaAgua: [Conta.contaAgua]
struct ContaView: View {
    @StateObject var vm = ViewModel()

    var body: some View {
        NavigationStack{
            HStack{
                Text("Contas").foregroundColor(Color.white).font(.largeTitle).fontWeight(.bold).padding(.trailing, 250)
       
            }.frame(width: 400,height: 40).background(Color("Cor1"))
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    
                    NavigationLink(destination: contasAPagarView()){
                        VStack(alignment: .leading){
                            VStack{
                                Image("financa")
                            }.frame(width: 30,height: 30).background(.white).cornerRadius(40).padding(.trailing, 50)
                            Text("Contas a pagar").foregroundColor(Color.white).fontWeight(.bold)                            }.frame(width: 100, height: 100).background(
                                LinearGradient(gradient:Gradient(colors: [.orange,.purple ]),startPoint: .top, endPoint: .bottom).cornerRadius(15)
                            )
                        
                    }
                    
                        
                        Spacer()
                        
                    NavigationLink(destination: contasPagasView()){
                        VStack(alignment: .leading){
                                VStack{
                                    Image("financa")
                                }.frame(width: 30,height: 30).background(.white).cornerRadius(40).padding(.trailing, 50)
                            Text("Contas pagas").foregroundColor(Color.white).fontWeight(.bold)
                        }.frame(width: 100, height: 100).background(
                            LinearGradient(gradient:Gradient(colors: [.green,.cyan ]),startPoint: .top, endPoint: .bottom).cornerRadius(15)
                        )
                    }
                    Spacer()
                    }
                Spacer()
                Chart {
                    ForEach(vm.contas, id: \.self){ conta in

                            BarMark(

                                x: .value("Type",conta.type), y: .value("Cup", conta.valor)
                            ).foregroundStyle(by: .value("contas", conta.type))
//

                    }

                }.padding(.top, 30)
                    .frame(width:350 , height: 350).onAppear(){
                    vm.fetch()
                
                
                                 
                        
                    }
                Spacer()
                    }
                    }
                }
                
            }
            
        

    


struct ContaView_Previews: PreviewProvider {
    static var previews: some View {
        ContaView()
    }
}
