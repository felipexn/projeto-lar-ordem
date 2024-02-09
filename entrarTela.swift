//
//  entrarTela.swift
//  finalPROJECT
//
//  Created by Turma01-2 on 05/02/24.
//

import SwiftUI

struct entrarTela: View {
    @State var nomeSala : String = ""
    @State var senhaSala : String = ""
    
    var body: some View {
        NavigationStack{
            
            VStack{
                Image("logo")
                Text("Entrar na sala da sua família")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Cor1"))
                    .multilineTextAlignment(.center)
                    .padding(.top, 20.0)
                    .frame(width: 240)
                Spacer()
            }
            .padding(.top, 10.0)
            Spacer()
            
            VStack(alignment: .leading, spacing: 20.0){
                VStack(alignment: .leading){
                    Text("Adicione o nome da sala")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Cor1"))
                    HStack(alignment: .center, spacing: 10.0){
                        Image("casa")
                        TextField("digite o nome da sala", text: $nomeSala)
                        
                    }.frame(width: 360, height: 50).border(Color("Cor1")).cornerRadius(10.0)
                    
                }

                VStack(alignment: .leading){
                    Text("Senha").font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Cor1"))
                    HStack(alignment: .center, spacing: 10.0){
                        Image("lock")
                        TextField("digite a senha da sala ", text: $senhaSala)
                    }.frame(width: 360, height: 50).border(Color("Cor1")).cornerRadius(10.0)
                }
                
                VStack(alignment: .leading){
                    HStack{
                        Text("Nao possui uma sala? ")
                        NavigationLink(destination: criarSala()){
                            Text("Criar").padding(.trailing, 39.0).accentColor(Color("Cor1"))
                        }.frame(width: 80)
                        
                    }
                }.padding(.leading, -40.0).frame(width: 300.0)
                Spacer()
            }.padding(.top, -40)
            Spacer()
            
            NavigationStack{
                
                VStack{
                    NavigationLink(destination:deshboar())
                    {
                        Text("Entrar").font(.title3).fontWeight(.bold).frame(width: 360, height: 50).cornerRadius(5.0).background(Color("Cor1")).accentColor(.white).cornerRadius(10)
                    }
                }
                    
            
            }
            .padding(.top, -100.0)

            Spacer()
        }
    }
}

struct entrarTela_Previews: PreviewProvider {
    static var previews: some View {
        entrarTela()
    }
}
