using DataFrames
using Plots
using StatsBase

nucleotides = ["A", "T", "G", "C"]
dna_data = rand(nucleotides, 1000)
df = DataFrame(DNA = dna_data)

freqs = countmap(dna_data)

p1 = bar(collect(keys(freqs)), collect(values(freqs)), title = "Nucleotide Frequencies", 
         xlabel = "Nucleotides", ylabel = "Frequency", legend = false, color = :blue)

p2 = pie(collect(keys(freqs)), collect(values(freqs)), title = "Nucleotide Distribution", 
         labels = collect(keys(freqs)), color = [:red :green :blue :orange])

cumulative_freqs = cumsum(collect(values(freqs)))

p3 = plot(collect(keys(freqs)), cumulative_freqs, title = "Cumulative Nucleotide Frequencies", 
          xlabel = "Nucleotides", ylabel = "Cumulative Frequency", legend = false, color = :purple)

p = plot(p1, p2, p3, layout = (3, 1))
savefig(p, "nucleotide_plots.png")