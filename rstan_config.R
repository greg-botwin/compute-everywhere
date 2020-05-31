## C++ toolchain configuration
dotR <- file.path(Sys.getenv("HOME"), ".R")
if (!file.exists(dotR)) dir.create(dotR)
M <- file.path(dotR, "Makevars")
if (!file.exists(M)) file.create(M)
cat("\nCXX14FLAGS=-O3 -march=native -mtune=native -fPIC",
    "CXX14=g++", # or clang++ but you may need a version postfix
    file = M, sep = "\n", append = TRUE)
    
 ## Set Number of Cores
 Sys.setenv(MAKEFLAGS = "-j4") # four cores used
 
 ## Install Rstan
 install.packages("rstan", type = "source")
