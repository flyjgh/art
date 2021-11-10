include("utils/ArtTransform.jl")
using .ArtTransform
using Images

one = load("C:/Users/jgh/Documents/J-Art/High/fluid/163.png")
two = load("C:/Users/jgh/Documents/J-Art/High/fluid/1.png")

negative(p) = p = RGB(1. - p.r, 1. - p.g, 1. - p.b)
modif(p) = p = RGB(p.r>0.01 ? p.r + 0.1 : p.r, p.g, p.b)

img = modif.(one)

sv(img, name="purp")
