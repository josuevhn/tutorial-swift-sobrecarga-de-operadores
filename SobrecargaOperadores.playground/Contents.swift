//: Playground - noun: a place where people can play

import Cocoa

struct Product : CustomStringConvertible {
    
    let nombre: String
    let precio: Double

    var description: String {
        
        return String("Producto: \(self.nombre.padding(toLength: 12, withPad: " ", startingAt: 0)) Precio: \(String(format: "%.2f", self.precio))$")
        
    }// description
    
    static func +=(lhs: inout Double, rhs: Product) {
        
        lhs = lhs + rhs.precio
        
    }// Overloading operator += (Double, Product)
    
    static func -(lhs: Product, rhs: Discount) -> Double {
        
        let ahorro = (lhs.precio * rhs.porciento) / 100
        
        let precioFinal = lhs.precio - ahorro
        
        return precioFinal

    } // Overloading operator - (Product, Discount)
    
} // Product

struct Discount : CustomStringConvertible {
    
    let porciento: Double

    func aplicarDescuento(product: Product) -> Double {
        
        let ahorro = (product.precio * porciento) / 100
        
        return ahorro

    } // aplicarDescuento
    
    var description: String {
        
        return String("Descuento: \(porciento)%")
        
    }// description
    
} // Discount

let leche = Product(nombre: "leche", precio: 0.50)
let pan = Product(nombre: "pan", precio: 0.75)
let queso = Product(nombre: "queso", precio: 3.25)
let pollo = Product(nombre: "pollo", precio: 4.00)
let morzilla = Product(nombre: "morzilla", precio: 2.00)
let tomate = Product(nombre: "tomate", precio: 0.10)

var comprasAPagar: Array<Product> = []

comprasAPagar.append(leche)
comprasAPagar.append(pan)
comprasAPagar.append(queso)
comprasAPagar.append(pollo)
comprasAPagar.append(morzilla)
comprasAPagar.append(tomate)

let descuento = Discount(porciento: 10)

var totalAPagar: Double = 0.0

print("Los productos facturados son:\n")

for product in comprasAPagar {
    
    //let ahorro = descuento.aplicarDescuento(product: product)
    
    //let precioFinal = product.precio - ahorro
    
    totalAPagar += (product - descuento)

    //totalAPagar += precioFinal
    
    //print("\(product)   \(descuento)   Ahorro: \(String(format: "%.3f", ahorro))$   Precio final: \(String(format: "%.3f", precioFinal))$")
    
    print("\(product)   \(descuento)")
    
} // for

print("\nEl total a pagar es de: \(String(format: "%.2f", totalAPagar))$")
