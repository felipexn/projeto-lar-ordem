//
//  criarSala.swift
//  finalPROJECT
//
//  Created by Turma01-2 on 05/02/24.
//

import SwiftUI


struct criarSala: View {
    
    @State var mostrando : Bool = false
    
    @State var nomeSalaCadastrada : String = ""
    @State var senhaSalaCadastrada : String = ""
    @State var membroDaSalaCadastrada : String = ""
    
    @State var listaMembros :[String] = []
   
    
    
    var body: some View {
        NavigationStack{
            
            VStack{
                Image("logo")
                Text("Crie a sala da sua família")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Cor1"))
                    .multilineTextAlignment(.center)
                
                    .frame(width: 310)
                
            }
            .padding(.top, 20.0)
            Spacer()
            
            VStack(alignment: .leading, spacing: 20.0){
                VStack(alignment: .leading){
                    Text("Adicione o nome da sala")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Cor1"))
                    HStack(alignment: .center, spacing: 10.0){
                        Image("casa")
                        TextField("digite o nome da sala", text: $nomeSalaCadastrada)
                        
                    }.frame(width: 360, height: 50).border(Color("Cor1")).cornerRadius(10.0)
                    
                }
                
                VStack(alignment: .leading){
                    Text("Senha").font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Cor1"))
                    HStack(alignment: .center, spacing: 10.0){
                        Image("lock")
                        TextField("digite sua senha ", text: $senhaSalaCadastrada)
                    }.frame(width: 360, height: 50).border(Color("Cor1")).cornerRadius(10.0)
                }
                VStack(alignment: .leading){
                    Text("Adicione os membros da sua familia").font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Cor1"))
                    HStack(alignment: .center, spacing: 10.0){
                        Image("carta")
                        TextField(" (um de cada vez) ", text: $membroDaSalaCadastrada)
                        
                    }.frame(width: 360, height: 50).border(Color("Cor1")).cornerRadius(10.0)
                    
                    HStack{
                        Button("Adicionar"){
                            mostrando.toggle()
                            if(membroDaSalaCadastrada != ""){
                                listaMembros.append(membroDaSalaCadastrada)
                                membroDaSalaCadastrada = ""
                                
                                
                            }
                            
                            
                        }.frame(width: 140, height: 40).background(Color("Cor1")).cornerRadius(10).accentColor(.white).fontWeight(.bold)    .frame(height: 58)
                        Button("mostrar"){
                            mostrando.toggle()
                        }.frame(width: 140, height: 40).background(Color("Cor1")).cornerRadius(10).accentColor(.white).fontWeight(.bold)    .frame(height: 58).sheet(isPresented: $mostrando){
                            List{
                                ForEach(listaMembros, id: \.self){ membro in
                                    Text(membro)
                                    
                                }
                            }
                        }
                        
                    }.frame(width: 360)
                        
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                }.padding(.top,50)
                
                Spacer()
                Spacer()
                NavigationStack{
                    
                    VStack{
                        NavigationLink(destination:deshboar())
                        {
                            Text("Entrar").font(.title3).fontWeight(.bold).frame(width: 360, height: 50).cornerRadius(5.0).background(Color("Cor1")).accentColor(.white).cornerRadius(10)
                        }
                    }
                    
                    
                }
                .padding(.top, -50.0)
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
        }
        
                                      }

struct criarSala_Previews: PreviewProvider {
    static var previews: some View {
        criarSala()
    }
}
