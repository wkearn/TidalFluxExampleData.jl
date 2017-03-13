using TidalDischargeModels, TidalFluxExampleData
using Base.Test

n = 6037 # Length of the first Sweeney data

creek = Creek{:sweeney}()
deps = parse_deps(creek)

# Figure out how platform independent this is
@test hash(deps[1]) == 0x9075efca49bb29bb
@test hash(deps[2]) == 0x6ddb46623bd6c559

@test length(deps) == 2
@test deps[1].location == creek
@test deps[1].startDate == DateTime(2015,07,08,12,00,00)
@test deps[1].endDate == DateTime(2015,08,19,10,00,00)

@test deps[1].adcp.serialNumber == "AQD 5062"
@test deps[1].adcp.hasAnalog == false
@test deps[1].adcp.blankingDistance == 0.1113778
@test deps[1].adcp.cellSize == 0.1999389
@test deps[1].adcp.nCells == 40
@test deps[1].adcp.deltaT == 600.0
@test deps[1].adcp.elevation == -1.588

adata = load_data.(deps)

@test length(adata) == 2
@test length(adata[1].p) == n

cs = parse_cs(creek)

@test cs.lmax == 13.944
@test cs.Amax == 20.674
@test cs.hmax == 0.35

csd = load_data(cs)

Q = DischargeData(adata[1],csd)
