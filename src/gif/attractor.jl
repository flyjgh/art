using Luxor, Colors

r(s, t) = rand(s:0.001:t)

function interference(frame_n, n::Int, k, l, dotsize, w)
    xmin = -2.0; xmax = 2.0; ymin= -2.0; ymax = 2.0
    origin()
    background("black")
    # control parameters
    a = 2.24 + frame_n
    b = .95 + 100 / frame_n
    c = -.15
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

function colorattract(frame_n, n::Int, k, l, dotsize, w)
    xmin = -2.0; xmax = 2.0; ymin= -2.0; ymax = 2.0
    origin()
    background("black")
    # control parameters
    a = 2.24
    b = .95 + (60 / frame_n)
    c = -.15 + (frame_n / 600)
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
    a = 2.2 + (frame_n / rand(800:900))
    b = .95 + (frame_n / rand(600:700))
    c = -.15 + (frame_n / rand(900:1100))
    d = -2.2 + (frame_n / rand(3500:4500))
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
                rcolor = rescale(yy, -1, 1, r(.1,.2),  r(.55, .9))
                gcolor = rescale(yy, -1, 1, r(.1,.35), r(.45,.8))
                bcolor = rescale(yy, -1, 1, r(.2,.5),  r(.6,.9))
                setcolor(convert(Colors.HSV, Colors.RGB(rcolor, gcolor, bcolor)))
                circle(Point(xpos, ypos), dotsize, :fill)
            end
        end
    end
end

function colorturn(frame_n, n::Int, k, l, dotsize, w)
    xmin = -2.0; xmax = 2.0; ymin= -2.0; ymax = 2.0
    origin()
    background("black")
    # control parameters
    a = 2.2 + (frame_n / rand(800:900))
    b = .95 + (frame_n / rand(600:700))
    c = -.15 + (frame_n / rand(900:1100))
    d = -2.2 + (frame_n / rand(3500:4500))
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

function turnmovie(w, nframes; fps, name="turnattract")
    mv = Movie(w, w, "mv")
    backg(scene, frame_n) = background("black")
    frame(scene, frame_n) = turnattract(frame_n, r(.32, .42), w)
    animate(mv, [
        Scene(mv, backg, 0:nframes),
        Scene(mv, frame, 0:nframes)],
        framerate = fps,
        pathname = "out/$name.gif",
        creategif = true)
end

function interferencemovie(w, nframes; fps, name="turnattract")
    mv = Movie(w, w, "mv")
    backg(scene, frame_n) = background("black")
    frame(scene, frame_n) = interference(frame_n, rand(1:3),rand(1:3),rand(1:3), r(.32, .42), w)
    animate(mv, [
        Scene(mv, backg, 0:nframes),
        Scene(mv, frame, 0:nframes)],
        framerate = fps,
        pathname = "out/$name.gif",
        creategif = true)
end

function colormovie(w, nframes; fps, name="colorattract")
    mv = Movie(w, w, "mv")
    backg(scene, frame_n) = background("black")
    frame(scene, frame_n) = colorattract(frame_n, rand(1:3),rand(1:3),rand(1:3), r(.32, .42), w)
    animate(mv, [
        Scene(mv, backg, 0:nframes),
        Scene(mv, frame, 0:nframes)],
        framerate = fps,
        pathname = "out/$name.gif",
        creategif = true)
end

function colorturnmovie(w, nframes; fps, name="colorturnattract")
    mv = Movie(w, w, "mv")
    backg(scene, frame_n) = background("black")
    frame(scene, frame_n) = colorturn(frame_n, rand(1:3),rand(1:3),rand(1:3), r(.32, .42), w)
    animate(mv, [
        Scene(mv, backg, 0:nframes),
        Scene(mv, frame, 0:nframes)],
        framerate = fps,
        pathname = "out/$name.gif",
        creategif = true)
end

colormovie(1024, 500, fps=45, name="color5")

function anim(ƒ, epochs; quality=512, frames=500, fps=45, name="turnattract3")
    for i ∈ 1:epochs
        ƒ(quality, frames, fps, name=name*"$i")
    end
end

anim(colorattract, 3, quality=1024, name="attr")
