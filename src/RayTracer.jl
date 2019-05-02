module RayTracer

using Requires

export raytrace
export Vec3, rgb
export SimpleSphere, CheckeredSphere, SimpleCylinder, CheckeredCylinder,
       Triangle
export get_primary_rays
export DistantLight, PointLight

include("utils.jl")
include("light.jl")
include("materials.jl")
include("objects.jl")
include("tracer.jl")
include("camera.jl")

@init @require Zygote="e88e6eb3-aa80-5325-afca-941959d7151f" include("zygote.jl")
@init @require Images="916415d5-f1e6-5110-898d-aaa5f9f070e0" include("imutils.jl")

end
