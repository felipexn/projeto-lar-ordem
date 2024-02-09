//
//  telaCadastro.swift
//  finalPROJECT
//
//  Created by Turma01-2 on 05/02/24.
//

import SwiftUI

struct telaCadastro: View {
    
    @State var emailCadastrado : String = ""
    @State var senhaCadastrado : String = ""
    
    
    var body: some View {
        NavigationStack{
            
            VStack{
                Image("logo")
                
                Text("Vamos Começar!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Cor1"))
                
            }
            .padding(.top, 40.0)
            Spacer()
            VStack(spacing: 30.0){
                VStack(alignment: .leading){
                    Text("Email")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Cor1"))
                    HStack(alignment: .center, spacing: 10.0){
                        Image("casa")
                        TextField("digite seu email", text: $emailCadastrado)
                        
                    }.frame(width: 360, height: 50).border(Color("Cor1")).cornerRadius(10.0)
                    
                }
                
                VStack(alignment: .leading){
                    Text("Senha").font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Cor1"))
                    HStack(alignment: .center, spacing: 10.0){
                        Image("lock")
                        TextField("digite sua senha", text: $senhaCadastrado)
                    }.frame(width: 360, height: 50).border(Color("Cor1")).cornerRadius(10.0)
                }
            }
            Spacer()
            
            NavigationStack{
                VStack{
                    NavigationLink(destination: ContentView())
                    {
                        Button("Cadastrar"){
                            
                        }.font(.title3).fontWeight(.bold).frame(width: 360, height: 50).cornerRadius(5.0).background(Color("Cor1")).accentColor(.white).cornerRadius(10)
                    }
                    NavigationStack{
                        VStack(alignment: .leading){
                            HStack{
                                Text("Possui uma conta?")
                                NavigationLink(destination: ContentView()){
                                    Text("Login").padding(.trailing, 55.0).accentColor(Color("Cor1"))
                                }.frame(width: 100)
                                
                            }
                        }.frame(width: 290.0)
                        
                    }
                    
                }
                
            }
            .padding(.bottom, 40.0)
            Spacer()
        }
    }
}

struct telaCadastro_Previews: PreviewProvider {
    static var previews: some View {
        telaCadastro()
    }
}
