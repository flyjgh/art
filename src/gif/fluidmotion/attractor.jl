using Luxor, Colors

r(s, t) = rand(s:0.001:t)

function colorattract(frame_n, n::Int, k, l, dotsize, w)
    xmin = -2.0; xmax = 2.0; ymin= -2.0; ymax = 2.0
    origin()
    background("black")
    # control parameters
    a = 2.24
    b = .95 + 100 / frame_n
    c = -.65
    d = -2.2
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
                h = v[n]; i = v[k]; j = v[l]
                rcolor = rescale(h, -1, 1, r(.1,.2),  r(.55, .9))
                gcolor = rescale(i, -1, 1, r(.1,.35), r(.45,.8))
                bcolor = rescale(j, -1, 1, r(.2,.5),  r(.6,.9))
                setcolor(convert(Colors.HSV, Colors.RGB(rcolor, gcolor, bcolor)))
                circle(Point(xpos, ypos), dotsize, :fill)
            end
        end
    end
end

function turnattract(frame_n, dotsize, w)
    xmin = -2.0; xmax = 2.0; ymin= -2.0; ymax = 2.0
    origin()
    background("black")
    # control parameters
    a = 2.2 + (frame_n / 800)
    b = .95 + (frame_n / 600)
    c = -.15 + (frame_n / 1000)
    d = -2.2 + (frame_n / 4000)
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
                rcolor = rescale(zz, -1, 1, r(.1,.2),  r(.55, .9))
                gcolor = rescale(yy, -1, 1, r(.1,.35), r(.45,.8))
                bcolor = rescale(xx, -1, 1, r(.2,.5),  r(.6,.9))
                setcolor(convert(Colors.HSV, Colors.RGB(rcolor, gcolor, bcolor)))
                circle(Point(xpos, ypos), dotsize, :fill)
            end
        end
    end
end

function turnmovie(w, nframes; fps=50)
    mv = Movie(w, w, "mv")
    backg(scene, frame_n) = background("black")
    frame(scene, frame_n) = turnattract(frame_n, r(.32, .42), w)
    animate(mv, [
        Scene(mv, backg, 0:nframes),
        Scene(mv, frame, 0:nframes)],
        framerate = fps,
        pathname = "turnattract.gif",
        creategif = true)
end

function colormovie(w, nframes; fps=50)
    mv = Movie(w, w, "mv")
    backg(scene, frame_n) = background("black")
    frame(scene, frame_n) = colorattract(frame_n, rand(1:3),rand(1:3),rand(1:3), r(.32, .42), w)
    animate(mv, [
        Scene(mv, backg, 0:nframes),
        Scene(mv, frame, 0:nframes)],
        framerate = fps,
        pathname = "colorattract.gif",
        creategif = true)
end

turnmovie(256, 400, fps=45)

