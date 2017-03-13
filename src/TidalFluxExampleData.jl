module TidalFluxExampleData

using TidalDischargeModels

setADCPdatadir!(Pkg.dir("TidalFluxExampleData","data","adcp"))
setmetdatadir!(Pkg.dir("TidalFluxExampleData","data","met"))

end # module
