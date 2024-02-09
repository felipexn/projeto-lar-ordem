//
//  ContasAPagarView.swift
//  ProjetoFinal
//
//  Created by Turma01-21 on 05/02/24.
//

import SwiftUI
import Charts

struct contasAPagarView: View {
   
    
    @StateObject var vm = ViewModel()
    @State private var showContaDetails: Bool = false
    
    @State var AuxConta : Conta?
    
    
    var body: some View{
        NavigationStack{
            
            VStack(spacing:9){
                VStack{
                    Text("Contas a pagar").foregroundColor(Color.white).font(.largeTitle).fontWeight(.bold).padding(.trailing, 130.0)
                }.frame(width: 400,height: 40).background(Color("Cor1"))
                Spacer()
                VStack{
                    List{
                        ForEach(vm.contas,id: \.self) { conta in
                            if(!conta.paga){
                                HStack{
                                    Button(action: {
                                        AuxConta = conta
                                        self.showContaDetails.toggle()
                                    }){
                                        HStack{
                                            Text(conta.nome).padding(15).fontWeight(.bold).foregroundColor(Color.black)
                                            Spacer()
                                            Text("R$ \(String(format: "%.2f", conta.valor))").padding(15).fontWeight(.bold).foregroundColor(Color.black)
                                            
                                        }.frame(width: 340, height: 30).background(Color("fundo"))
                                    }
                                }
                            }
                            
                        }.onDelete(perform: vm.remove)
                    }
                    .sheet(isPresented: $showContaDetails) {
                        SheetViewPagar(AuxConta: $AuxConta)
                    }
                }.onAppear(){
                    
                        vm.fetch()
                    
                }.font(.system(size: 17))
                
                Spacer()
                
                Chart {
                    ForEach(vm.contas, id: \.self){ conta in
                        if(!conta.paga){
                            BarMark(
                                
                                x: .value("Type",conta.type), y: .value("Cup", conta.valor)
                                
                            ).foregroundStyle(Color(.red))
                        }
                    }
                    
                }.frame(width:300 , height: 250)
                
                Spacer()
                
                HStack{
                    NavigationLink(destination: addNovaContaView()){
                        
                        Text("Adicionar nova conta").frame(width: 200,height: 30).background(Color("Cor1")).fontWeight(.bold).foregroundColor(Color.white).cornerRadius(6)
                     
                            

                        
                    }
                }
                Spacer()
            }
            
        }
        
    }
}

struct contasAPagar_Previews: PreviewProvider {
    static var previews: some View {
        contasAPagarView()
    }
}





