//
//  ContasPagasView.swift
//  ProjetoFinal
//
//  Created by Turma01-21 on 05/02/24.
//
import Charts
import SwiftUI

struct contasPagasView: View {

    @State private var showContaDetails: Bool = false
    @State private var showPagarAlert: Bool = false
    
    @StateObject var vm = ViewModel()
    
    
    
    @State var auxconta : Conta?
    
    var body: some View {
        
        VStack{
            
            HStack{
                Image("logo")
                
            }
            .frame(width:390).background(.white)
            
            List{
                ForEach(vm.contas, id: \.self) { conta in
                    if(conta.paga){
                    HStack{
                        Button(action: {
                                auxconta = conta
                                self.showContaDetails.toggle()
                            }) {
                                HStack{
                                    Text(conta.nome).padding(15).fontWeight(.bold).foregroundColor(Color.black)
                                    Spacer()
                                    Text("R$ \(String(format: "%.2f", conta.valor))").padding(15).fontWeight(.bold).foregroundColor(Color.black)
                                    
                                }.frame(width: 340, height: 30).background(Color("fundo"))

                                
                            }
                           
                        }
                    }
                }.onDelete(perform: vm.remove)
                
            }.onAppear(){
                vm.fetch()
            }
            Chart {
                ForEach(vm.contas, id: \.self){ conta in
                    if(conta.paga){
                        BarMark(
                            
                            x: .value("Type",conta.type), y: .value("cup", conta.valor)
                            
                        ).foregroundStyle(Color(.green))
                    }
                }
                
            }.frame(width:300 , height: 250)
            
        }
        
  
        .sheet(isPresented: $showContaDetails) {
            VStack {
                Text("Detalhes da Conta").foregroundColor(Color.purple).fontWeight(.bold)
                    .font(.title)
                    .padding()
                    
                Spacer()
                if(auxconta != nil){
                    VStack(spacing: 10){
                       
                        Text("Nome: \(auxconta!.nome)").padding(15).fontWeight(.bold).foregroundColor(Color.black)
                        Text("Valor: R$ \(String( format:"%.2f",auxconta!.valor))").padding(15).fontWeight(.bold).foregroundColor(Color.black)
                        Text("Data: \(auxconta!.data)").padding(15).fontWeight(.bold).foregroundColor(Color.black)
                        Text("Tipo: \(auxconta!.type)").padding(15).fontWeight(.bold).foregroundColor(Color.black)
                    }
                    Spacer()
                    HStack{
                        Image("logo")
                        
                    }
                    .frame(width:390).background(.white)
                    
                }
                Spacer()
                
            
            }
            .padding()
            
            
            
        }
    }
}






struct contasPagasView_Previews: PreviewProvider {
    static var previews: some View {
        contasPagasView()
    }
}
