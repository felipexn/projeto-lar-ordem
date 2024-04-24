//
//  ContentView.swift
//  ProjetoFinal
//
//  Created by Turma01-5 on 05/02/24.
//

import SwiftUI


struct telaTarefas: View {
    @State private var estaAdicionandoTarefa = false
    @State private var data: String = ""
    @State private var membroSelecionado: String = ""
    @State private var novaTarefa: String = ""
    
    @State private var tarefasPrincipais: [String] = []
    @State var teste22 : Int = 0
    
    @State private var tarefas: [String] = ["sdasd"]
    @State private var datas: [String] = ["221312"]
    @State private var nomes: [String] = ["andre"]
    
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30.0) {
                
                
                
                
                VStack {
                    HStack {
                        Text("Tarefas")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding()
                        Spacer()
                        HStack(spacing: 15.0){
                            Button(action: {
                                // Ação para o botão de pesquisa
                            }) {
                                VStack{
                                    Image("lupa")
                                }.padding(.all, 10.0).frame(width: 50, height: 40).background(.white).cornerRadius(5)
                                
                                
                            }
                            .foregroundColor(.white)
                            
                            
                            Button(action: {
                                // Ação para o botão de filtro
                            }) {
                                VStack{
                                    Image("filtro")
                                    
                                    
                                    
                                }.frame(width: 50, height: 40).background(.white).cornerRadius(5)
                            }
                            
                        }.padding(.trailing, 30.0)
                    }
                    
                }.frame(width: 400,height: 90).background(Color("Cor1"))
                
                ZStack {
                    Color("fundo")
                    
                    VStack {
                        if estaAdicionandoTarefa {
                            VStack{
                                HStack{
                                    TextField("Data", text: $data)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                    TextField("Membro", text: $membroSelecionado)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(10)
                                    .padding(.horizontal)}
                                TextField("Digite uma tarefa", text: $novaTarefa)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                
                            }
                            
                            Button(action: {
                                if !novaTarefa.isEmpty {
                                    tarefas.append(novaTarefa)
                                    datas.append(data)
                                    nomes.append(membroSelecionado)
                                    
                                    for index in Global.listaMusica.indices {
                                        let item = Global.listaMusica[index]
                                        if membroSelecionado == item.name {
                                            Global.listaMusica[index].valorAtribuido += 1
                                        }
                                    }

                                    
                                    novaTarefa = ""
                                    estaAdicionandoTarefa = false // Esconder o TextField após adicionar a tarefa
                                }
                            }) {
                                Text("Adicionar")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Cor1"))
                            }
                            .frame(height: 48)
                            .padding(.trailing)
                        } else {
                            Button(action: {
                                estaAdicionandoTarefa = true // Mostrar o TextField quando o botão for pressionado
                            }) {
                                Image("add")
                                Text("add Tarefa")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Cor1"))
                            }
                            .frame(width: 160, height: 48)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding()
                            .foregroundColor(Color("Cor1"))
                        }
                    }
                }
                .padding(.bottom)
                
               
                    List {
                        
                        VStack(spacing: 40.0){
                            
                            ForEach(Array(nomes.enumerated()),  id: \.offset){ index, componente in
                                
                                
                                HStack(spacing: 190.0){
                                    Text(nomes[index])
                                        .font(.body)
                                        .fontWeight(.bold)
                                    
                                    
                                    Text(datas[index]).fontWeight(.bold)
                                }.frame(width: 370.0, height: 34).border(.black).background(Color("fundo"))
                                HStack{
                                    Text("-").padding(.top, 2).fontWeight(.bold)
                                    Text(tarefas[index]).fontWeight(.bold)
                                    
                                }
                                
                                Text("-------------------------------------------")
                                
                            }
                            
                        }.padding(.all, 15.0)
                            .frame(width: 370).background(Color.white).cornerRadius(12
                            ).shadow(radius: 19).border(.black)
                        
                    }
                    
                    .listStyle(PlainListStyle())
                    .padding(.bottom) // Adicionando espaço abaixo da lista
                
            
            }
            .navigationBarTitle("", displayMode: .inline) // Removendo o título da barra de navegação
            .navigationBarHidden(true) // Escondendo a barra de navegação
        }
    }
}

struct telaTarefas_Previews: PreviewProvider {
    static var previews: some View {
        telaTarefas()
    }
}
