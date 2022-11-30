print("         ALMACENE EL AMANECER")
name = str(input("Ingrese su nombre"))
cantpan = int(input("Ingrese los pantalones a llevar"))

subto = float(cantpan*160.50)
descuento=float
if cantpan < 7:
    if subto>700:
        descuento=subto*0.05

    else:
        descuento=0
elif cantpan < 11:
    descuento = subto * 0.10

elif cantpan >10:
    descuento = subto * 0.25


print("    EL TOTAL A PAGAR DE LOS PANTALONES ES")
print("Nombre: ",name)
print("Subtotal: ",subto)
print("descuento: ",descuento)
print("Total:",(subto-descuento))

