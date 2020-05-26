using HRV
using Test

n=HRV.infile("e1304.txt")
td=HRV.time_domain(n)
fd=HRV.frequency(n)
nl=HRV.nonlinear(n)

@testset "HRV.jl" begin

    @testset "HRV.infile" begin
        @test HRV.infile("e1304","atr")==n
    end

    @testset "HRV.time_domain" begin
        @test td.mean≈917.24 atol=0.1
        @test td.sdnn≈137.19 atol=0.1
        @test td.rmssd≈27.85 atol=0.1
        @test td.sdsd≈20.35 atol=0.1
        @test td.nn50≈342 atol=1
        @test td.pnn50≈4.413472706155633 atol=0.1
        @test td.nn20≈2831 atol=1
        @test td.pnn20≈36.53374628984385 atol=0.1
    end

    @testset "HRV.frequency" begin
        @test fd.vlf≈1317.96 atol=0.01*fd.vlf
        @test fd.lf≈90.36 atol=0.01*fd.lf
        @test fd.hf≈176.05 atol=0.01*fd.hf
        @test fd.lf_hf_ratio≈0.51 atol=0.01*fd.lf_hf_ratio
        @test fd.tp≈1584.35 atol=0.01*fd.tp
    end

    @testset "HRV.nonlinear" begin
        @test nl.apen≈2.16 atol=0.1
        @test nl.sampen≈2.16 atol=0.1
        @test nl.hurst≈0.37 atol=0.1
        @test nl.renyi0≈-6.82 atol=0.1
        @test nl.renyi1≈-6.83 atol=0.1
        @test nl.renyi2≈-6.84 atol=0.1
    end
end
