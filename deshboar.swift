//
//  deshboar.swift
//  finalPROJECT
//
//  Created by Turma01-2 on 05/02/24.
//

import SwiftUI
import Charts

struct Global{
    static var teste = 1
    
    static var listaMusica = [
        Song(id:1, name:"Andre", valorAtribuido:5, valorFeito: 1, valorNaoFeito: 4),
        Song(id:2, name:"Joao", valorAtribuido:0, valorFeito: 0, valorNaoFeito: 0),
        Song(id:3, name:"Maria", valorAtribuido:4, valorFeito: 2, valorNaoFeito: 2),
        Song(id:4, name:"Runilda", valorAtribuido:3,valorFeito: 1, valorNaoFeito: 2),
        Song(id:5, name:"Roberto", valorAtribuido:9,valorFeito: 7, valorNaoFeito: 2),
        Song(id:6, name:"Carla", valorAtribuido:4,valorFeito: 3, valorNaoFeito: 1),
        Song(id:7, name:"Felipe", valorAtribuido:2, valorFeito: 1, valorNaoFeito: 1),
        Song(id:8, name:"Arthur", valorAtribuido:1, valorFeito: 0, valorNaoFeito: 1),
        Song(id:9, name:"Roberta", valorAtribuido:8, valorFeito: 6, valorNaoFeito: 2),
        Song(id:10, name:"Sara", valorAtribuido:3,valorFeito: 2,valorNaoFeito: 1)]
    
}



struct Song : Identifiable{
    var id: Int
    var name: String
    var valorAtribuido : Int
    var valorFeito : Int
    var valorNaoFeito : Int

}

struct ChartData : Identifiable {
    let id = UUID()
    let type: String
    let count: Float
}
struct deshboar: View {
    
    
    
    @State private var listaMusica : [Song] = []
    
    
    
    
    @State var nomeFamilia : String = ""
    
//    let data = [ChartData(type: "Água", count: 10.56),
//                ChartData(type: "Energia", count: 21.04),
//                ChartData(type: "Internet", count: 103.00),
//                ChartData(type: "Outros", count: 400.00)]
    @StateObject var vm = ViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 100.0){
            NavigationStack(){
                
                VStack(alignment: .leading){
                    HStack(alignment: .center){
                        Image("casa").resizable().frame(width: 60, height: 40)
                            .padding(.leading, 24.0)
                        VStack{
                            Text("Nome Sala").font(.title3).fontWeight(.bold).frame(width: 120)
                            Text("room").frame(width: 120
                            ).padding(.trailing, 60.0)
                        }
                        .padding([.top, .bottom, .trailing], 12.0)
                    }
                    .padding(.trailing, 100.0)
                    
                }.frame(width: 370).background(Color.white).cornerRadius(12
                ).shadow(radius: 15)
                
                VStack{
                    Chart(vm.contas,id: \.self) { dataPoint in
                        BarMark(x: .value("Population", dataPoint.valor),
                                y: .value("Type", dataPoint.type))
                        .foregroundStyle(by: .value("Type", dataPoint.type))
                        .annotation(position: .trailing) {
                            Text(String(dataPoint.valor))
                                .foregroundColor(.gray)
                        }
                    }
                    .chartLegend(.hidden)
                    .chartXAxis(.hidden)
                    .chartYAxis {
                        AxisMarks { _ in
                            AxisValueLabel()
                        }
                    }
                    .aspectRatio(1, contentMode: .fit)
                    .padding()
                }.frame(width: 370).background(Color.white).cornerRadius(12
                ).shadow(radius: 15).onAppear(){
                    vm.fetch()
                }
                
                
                VStack(spacing: 20.0){
                    Text("Serviços")
                        .padding(.trailing, 250.0)
                        .frame(width: 360)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Cor1"))
                    
                    HStack{
                        NavigationLink(destination: mercadoTela()){
                            VStack(alignment: .leading){
                                VStack{
                                    Image("carrinho")
                                }.frame(width: 30,height: 30).background(.white).cornerRadius(40)
                                
                                Text("Mercado").font(.body).fontWeight(.black).padding(.top, 8.0).accentColor(.white)
                            }.frame(width: 100, height: 100).background(
                                LinearGradient(gradient:Gradient(colors: [.blue,.purple ]),startPoint: .top, endPoint: .bottom).cornerRadius(15)
                            )
                        }
                            //                        xxx-xxxx\
                            Spacer()
                            NavigationLink(destination: telaTarefas()){
                                VStack(alignment: .leading){
                                    VStack{
                                        Image("lista")
                                    }.frame(width: 30,height: 30).background(.white).cornerRadius(40)
                                    
                                    Text("Tarefas").font(.body).fontWeight(.black).padding(.top, 8.0).accentColor(.white)
                                }.frame(width: 100, height: 100).background(
                                    LinearGradient(gradient:Gradient(colors: [.orange,.purple ]),startPoint: .top, endPoint: .bottom).cornerRadius(15)
                                )
                            }
                           
                            Spacer()
                            //                        xxx-xxxx
                        NavigationLink(destination: ContaView()){
                            VStack(alignment: .leading){
                                VStack{
                                    Image("financa")
                                }.frame(width: 30,height: 30).background(.white).cornerRadius(40)
                                
                                Text("Finanças").font(.body).fontWeight(.black).padding(.top, 8.0).accentColor(.white)
                            }.frame(width: 100, height: 100).background(
                                LinearGradient(gradient:Gradient(colors: [.green,.blue ]),startPoint: .top, endPoint: .bottom).cornerRadius(15)
                            )
                        }
                        }
                    }
                
                
                .padding(.all, 15.0)
                .frame(width: 370).background(Color.white).cornerRadius(12
                ).shadow(radius: 19)
                
                
                VStack{
                    Text("Tarefas")
                        .frame(width: 200)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Cor1"))
                        .padding(.trailing, 260.0)
                    ScrollView(.horizontal){
                        HStack(spacing: 25.0){
                            
                            ForEach(listaMusica) { musica in
                                VStack(alignment: .center, spacing: 5.0){
                                    Text("\(musica.name)")
                                        .foregroundColor(Color.black)
                                    VStack{
                                        HStack{
                                            Button(""){
                                                
                                            }.frame(width: 20, height: 20).background(Color("Cor1")).cornerRadius(20)
                                            Text("=")
                                            Text("\(musica.valorAtribuido)")
                                        }
                                        HStack{
                                            Button(""){
                                                
                                            }.frame(width: 20, height: 20).background(Color("Cor5")).cornerRadius(20)
                                            Text("=")
                                            Text("\(musica.valorFeito)")
                                        }
                                        HStack{
                                            Button(""){
                                                
                                            }.frame(width: 20, height: 20).background(Color.red).cornerRadius(20)
                                            Text("=")
                                            Text("\(musica.valorNaoFeito)")
                                        }
                                        
                                    }
                                }
                            }
                        }
                        
                    }
                    
                }.padding(.all, 15.0)
                    .frame(width: 370).background(Color.white).cornerRadius(12
                    ).shadow(radius: 19)
            }
            
        }.onAppear(){
            Global.listaMusica[1].valorAtribuido = 3
            listaMusica =  Global.listaMusica
        }
    }
}

struct deshboar_Previews: PreviewProvider {
    static var previews: some View {
        deshboar()
    }
}
