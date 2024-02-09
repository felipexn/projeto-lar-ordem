//
//  ContentView.swift
//  ProjetoFinal
//
//  Created by Turma01-5 on 05/02/24.
//

import SwiftUI

struct Lista : Hashable{
    var nome: String
    var data: String
    var produtos : [String]
}

struct mercadoTela: View {
    
    
    @State var listas : [Lista] = []
    
    @State var membroDaSalaCadastrada : String = ""
    @State var mostrando : Bool = false
    @State var listaMembros :[String] = []
    
    @State private var estaAdicionandoCompra = false
    @State private var data: String = ""
    @State private var NomeListaSelecionado: String = ""
    @State private var produtosLista: String = ""
    
    @State var comprasPrincipais: [String] = []
    
    
    @State private var tarefas: [String] = []
    @State private var datas: [String] = []
    @State private var nomesListaCompra: [String] = []
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30.0) {
                
                VStack {
                    HStack {
                        Text("Mercado")
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
                                                          
                
                VStack {

                    
                    VStack {
                        if estaAdicionandoCompra {
                            VStack{
                                HStack{
                                    TextField("Data da compra", text: $data)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                    TextField("Nome da lista", text: $NomeListaSelecionado)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(10)
                                    .padding(.horizontal)}
                                TextField("Digite os produtos", text: $produtosLista)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                
                            }
                            
                            HStack{
                                
                                VStack{
                                    Button(action: {
                                        mostrando.toggle()
                                        
                                        
                                        if produtosLista != "" {
                                            comprasPrincipais.append(produtosLista)
                                            
                                        }
                                        
                                        produtosLista = ""
                                        
                                    }) {
                                        VStack(){
                                            Text("Adicionar produto")
                                                .fontWeight(.bold)
                                                .foregroundColor(Color("Cor6"))
                                                .frame(height: 48)
                                                .padding(.trailing, 1.0)
                                        }
                                    }.frame(width: 140).background(Color("Cor1")).cornerRadius(10)
                                    Button(action: {
                                        //                                mostrando.toggle()
                                        
                                        let lst : Lista = Lista(nome: NomeListaSelecionado, data: data, produtos: comprasPrincipais)
                                        
                                        listas.append(lst)
                                        
                                        comprasPrincipais = []
                                        
                                    }) {
                                        VStack{
                                            Text("Finalizar Lista").accentColor(.white).fontWeight(.bold)    .frame(height: 48)
                                        }.frame(width: 140).background(Color("Cor1")).cornerRadius(10)
                                        
                                    }
                                }
                                VStack{
                                    
                                    Text("TOTAL DE ITENS").fontWeight(.bold)
                                    Text("NA LISTA").fontWeight(.bold)
                                    Text("")
                                    Text("\(comprasPrincipais.count)").frame(width: 50,height: 30).background(Color("Cor5"))
                                    
                                }.frame(width: 180).padding(.top, 20)
                            }.padding(.top, 27)
                            
                        }
                        else {
                            Button(action: {
                                estaAdicionandoCompra = true // Mostrar o TextField quando o botão for pressionado
                            }) {
                                Image("add")
                                Text("Add lista de compras")
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
                    
                }.frame(width: 395, height: 300).background(Color("fundo"))
                .padding(.bottom)
                //                Text(4comprasPrincipais)
                
                List {
                    
                    VStack(spacing: 30.0){
                        
                        ForEach(listas,  id: \.self){ lista in
                            
                            
                            HStack{
                                Text(lista.nome).fontWeight(.bold).padding(.trailing, 130)
                                Text(lista.data).fontWeight(.bold)
                                
                            }.frame(width: 370.0, height: 34).border(.black).background(Color("fundo"))
                            
                            ForEach(lista.produtos, id: \.self){ p in
                              
                                HStack{
                                    Text("*").padding(.top, 9).fontWeight(.bold)
                                    Text(p).padding(5).fontWeight(.bold)
                                }
                                
                            }
                        }.frame(width: 340)
                        
                    }.padding()
                        .frame(width: 370).background(Color.white).cornerRadius(12
                        ).shadow(radius: 19).border(.black)
                    
                    
                }.listStyle(PlainListStyle())
                    .padding(.bottom) // Adicionando espaço abaixo da lista
                    
                
            }
        
            
            
            
        }
     //   .navigationBarTitle("", displayMode: .inline) // Removendo o título da barra de navegação
       // .navigationBarHidden(true) // Escondendo a barra de navegação
    }
}


struct mercadoTela_Previews: PreviewProvider {
    static var previews: some View {
        mercadoTela()
    }
}
