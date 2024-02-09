//
//  SheetViewPagar.swift
//  projetofim
//
//  Created by Turma01-21 on 06/02/24.
//

import SwiftUI

struct SheetViewPagar: View {
    @StateObject var vm = ViewModel()
    @Binding var AuxConta : Conta?
    @State private var showPagarAlert: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Detalhes da Conta:")
                .font(.title)
                .padding()
            
            if(AuxConta != nil){
                VStack(spacing: 10){
                    
                    Text("Nome: \(AuxConta!.nome)")
                    Text("Valor: R$ \(AuxConta!.valor)")
                    Text("Data: \(AuxConta!.data)")
                    Text("Tipo: \(AuxConta!.type)")
                    
                    
                    HStack{
                        Image("logo")
                        
                    }
                    .frame(width:390).background(.white)
                }.padding(15).fontWeight(.bold).foregroundColor(Color.black)
                
            }
            Spacer()
            
            Button(action: {
                
                print(AuxConta)
                
                AuxConta!.paga=true
                self.showPagarAlert = true
                
                vm.update(AuxConta!)
                
                vm.fetch()
                
                
            }) {
                Text("Pagar Conta")
            }
            .padding()
        }
        .padding()
        .alert(isPresented: $showPagarAlert) {
            let pagaButton = Alert.Button.default(Text("Pagar")) {
                dismiss()
            }
            let cancelButton = Alert.Button.cancel()
            
            return Alert(
                title: Text("Pagar Conta"),
                message: Text("Deseja pagar esta conta?"),
                primaryButton: pagaButton,
                secondaryButton: cancelButton)
        }
        
        Spacer()
    }
}
