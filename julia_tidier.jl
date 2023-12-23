#!/usr/bin/env julia

# Hello world
println("Hello world!")

# A for loop
for i in 1:100
    println(i)
end

# A while loop
i = 0

while i <= 100
    println(i)
    global i += 1
end

# Check the value

x = 0

if x == 0
    println("$(x) is zero")
else
    println("x is not zero")
end

# Use Tidier 

# Load the required libraries and packages
using Tidier
using RDatasets

# Get the movies ggplot2 dataset
movies = dataset("ggplot2", "movies");

select_movies = @chain movies begin
    @mutate(Budget = Budget / 1_000_000, Budget_in_mil = Budget /1_000_000)
    @filter(Budget >= mean(skipmissing(Budget)))
    @select(Title, Budget, Budget_in_mil)
    @slice(1:10)
end

# Get the select_movies
println(select_movies)

# Get the size of select movies
(nrow, ncol) = size(select_movies)
println("The \"movies\" dataset has $nrow rows and $ncol columns")



