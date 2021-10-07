using Luxor, Colors

r(s, t) = rand(s:0.001:t)

function strange(q, n, k, l, dotsize=.36, w=800.0)
    xmin = -2.0; xmax = 2.0; ymin= -2.0; ymax = 2.0
    Drawing(w, w, "./out/strange-vectors$q.png")
    origin()
    background("black")
    xinc = w / (xmax - xmin)
    yinc = w / (ymax - ymin)
    # control parameters
    a = r(2., 2.24)
    # a = 2.24
    b = r(.8, .95)
    # b = .95
    c = r(-.15, -.05)
    # c = -.65
    d = r(-3.,-2.2)
    # d = -2.2
    e1 = 1.0
    x = y = z = 0.0
    wover2 = w / 2
    for j in 1:w
        for i in 1:w
            xx = sin(a * y) - z  *  cos(b * x)
            yy = z * sin(c * x) - cos(d * y)
            zz = e1 * sin(x)
            x = xx; y = yy; z = zz
            if xx < xmax && xx > xmin && yy < ymax && yy > ymin
                xpos = rescale(xx, xmin, xmax, -wover2, wover2)
                ypos = rescale(yy, ymin, ymax, -wover2, wover2)
                v = [xx, yy, zz]
                h = v[n]; o = v[k]; u = v[l]
                rcolor = rescale(h, -1, 1, r(.0,.1), r(.5,.9))
                gcolor = rescale(o, -1, 1, r(.05,.35), r(.3,.8))
                bcolor = rescale(u, -1, 1, r(.1,.5), r(.6,.9))
                setcolor(convert(Colors.HSV, Colors.RGB(rcolor, gcolor, bcolor)))
                circle(Point(xpos, ypos), dotsize, :fill)
            end
        end
    end
    finish()
end

function save(n)
    for c in 1:n
        strange(1, rand(1:3),rand(1:3),rand(1:3), r(.32, .42), 200)
    end
end

save(5)
