//
//  ContentView.swift
//  finalPROJECT
//
//  Created by Turma01-2 on 05/02/24.
//

import SwiftUI

 

struct ContentView: View {
    @State var email : String = ""
    @State var senha : String = ""

    
    var body: some View {
        NavigationStack{
            
            VStack{
                Image("logo")
                
                Text("Olá, Bem vindo!")
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
                        TextField("digite seu email", text: $email)
                        
                    }.frame(width: 360, height: 50).border(Color("Cor1")).cornerRadius(10.0)
                    
                }
                
                VStack(alignment: .leading){
                    Text("Senha").font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Cor1"))
                    HStack(alignment: .center, spacing: 10.0){
                        Image("lock")
                        TextField("digite sua senha", text: $senha)
                    }.frame(width: 360, height: 50).border(Color("Cor1")).cornerRadius(10.0)
                }
                
                VStack(alignment: .leading){
                    HStack{
                        Text("Esqueceu a")
                        NavigationLink(destination: telaCadastro()){
                            Text("Senha ?").accentColor(Color("Cor1"))
                        }.frame(width: 70)
                        
                    }
                }.padding(.leading, -180.0).frame(width: 360.0)
                
            }
            Spacer()
            
            NavigationStack{
                VStack{
                    NavigationLink(destination:entrarTela())
                    {
                        Text("Entrar").font(.title3).fontWeight(.bold).frame(width: 360, height: 50).cornerRadius(5.0).background(Color("Cor1")).accentColor(.white).cornerRadius(10)
                    }
                    NavigationLink(destination:telaCadastro())
                    {
                        VStack(alignment: .leading){
                            HStack{
                                Text("Nao possui uma conta?").accentColor(.black)
                                NavigationLink(destination: telaCadastro()){
                                    Text("Cadastra-se").accentColor(Color("Cor1"))
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
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

