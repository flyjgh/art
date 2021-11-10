module ArtTransform

    export get_data, get_img, sv, create_gif
    export rev, updown, diagonal, FourTiles
    export negative, newrgb, newrgbifpositive

    using Plots, Images, FileIO


    get_data(dir) = readdir(dir,join=true) .|> load
    get_img = Images.load

    function rev(x)       return  reverse(x ,dims = 2) end
    function updown(x)    return  reverse(x ,dims = 1) end
    function diagonal(x)  return  rev(updown(x))       end
    function FourTiles(x) return  [   x        rev(x)
                                        updown(x) diagonal(x)] end

    negative(p) = p = RGB(1. - p.r, 1. - p.g, 1. - p.b)
    newrgb(p,x,y,z) = p = RGB(p.r+x, p.g + y, p.b + z)
    function newrgbifpositive(p,x,y,z)
        p = RGB(
            p.r>0. ? p.r + x : p.r,
            p.g>0. ? p.g + y : p.g,
            p.b>0. ? p.b + z : p.b)
    end
    
    """
        function create_gif(name, dir, fps=5)

    Takes a directory of of images -> `.gif`

    # Examples
    ```julia-repl
    julia> create_gif("xx","C:/Users/images")
    ┌ Info: Saved animation to
    └   fn = "C:/Users/images/xx.gif"
    ```
    """
    function create_gif(name, dir, fps=5)
        l=pwd(); cd(dir)
        anim = @animate for img ∈ get_data(dir)
            plot(img, background="black",axis=nothing)
        end
        gif(anim, eval(name)*".gif", fps = eval(fps))
        cd(l)
    end


    """
        sv(data; dir="C:/...", name="new")

    # Examples
    ```julia-repl
    julia> images = "path" |> get_data |> FourTiles
    Vector{Array{ColorTypes.RGB{FixedPointNumbers.Normed{UInt8,8}},2}} with n elements
    julia> images |> sv
    Done.
    julia> sv(images, "C:/Users/images/", "Faces")
    Done.
    ```
    """
    function sv(data::Vector; dir="C:/Users/jgh/Documents/J-Art/jl", name="new")
        l=pwd(); i=1; cd(dir)
        for img ∈ data
            save(File(format"PNG",name*"$i.png"), img); i+=1
        end
        cd(l); println("Done.")
    end

    function sv(data::Matrix; dir="C:/Users/jgh/Documents/J-Art/jl", name="new")
        l=pwd(); cd(dir); save(File(format"PNG",name*".png"), data)
        cd(l); println("Done.")
    end
end
