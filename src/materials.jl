# Colors

abstract type SurfaceColor end

struct PlainColor <: SurfaceColor
    color
end

diffusecolor(c::PlainColor, pt::NamedTuple{(:x, :y, :z)}) = c.color

struct CheckeredSurface <: SurfaceColor
    color1
    color2
end

function diffusecolor(c::CheckeredSurface, pt::NamedTuple{(:x, :y, :z)})
    checker = (Int.(floor.(abs.(pt.x .* 2.0f0))) .% 2) .==
              (Int.(floor.(abs.(pt.z .* 2.0f0))) .% 2)
    return c.color1 * checker + c.color2 * (1.0f0 .- checker)
end

# Materials

struct Material{S<:SurfaceColor, R<:AbstractFloat}
    color::S
    reflection::R
end                          

diffusecolor(m::Material, pt::NamedTuple{(:x, :y, :z)}) =
    diffusecolor(m.color, pt)
