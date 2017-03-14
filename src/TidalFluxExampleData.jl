module TidalFluxExampleData

using PIEMetData, ADCPDataProcessing

setADCPdatadir!(Pkg.dir("TidalFluxExampleData","data","adcp"))
setmetdatadir!(Pkg.dir("TidalFluxExampleData","data","met"))

end # module
