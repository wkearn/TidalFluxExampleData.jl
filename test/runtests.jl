using TidalFluxExampleData
using Base.Test

@test in("adcp",readdir(Pkg.dir("TidalFluxExampleData","data")))
@test in("met",readdir(Pkg.dir("TidalFluxExampleData","data")))
