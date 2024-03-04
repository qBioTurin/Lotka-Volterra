library(epimod)

downloadContainers()

main_dir <- getwd()
setwd("./Net") 


print(getwd())

model.generation(net_fname = "Lotka-Volterra.PNPRO")

setwd("..")

# Sensitivity Analysis check

sensitivity<-model.sensitivity(n_config = 30,
                               parameters_fname = "Input/Functions_list.csv",
                               functions_fname = "Rfunction/Functions.R",
                               solver_fname = "Net/Lotka-Volterra.solver",
                               reference_data = "Input/reference_data.csv",
                               distance_measure = "msqd" ,
                               target_value  = "Target" ,
                               parallel_processors = 2,
                               f_time = 20,
                               s_time = .1)

# Model Calibration check

model.calibration(solver_fname = "Net/Lotka-Volterra.solver",
                  parameters_fname = "Input/Functions_list.csv",
                  functions_fname = "Rfunction/Functions.R",
                  reference_data = "Input/reference_data.csv",
                  distance_measure = "msqd" ,
                  f_time = 20,
                  s_time = .1,
                  # Vectors to control the optimization
                  ini_v = c(5,5),
                  ub_v = c(10, 10),
                  lb_v = c(0, 0),
                  max.time = 60 # seconds
)

# Model Analysis check

model.analysis(solver_fname = "Net/Lotka-Volterra.solver",
               parameters_fname = "Input/Paramters_list.csv",
               f_time = 50,
               s_time = .5
)

# Analysis Plot

source("Rfunction/ModelAnalysisPlot.R")

AnalysisPlot = ModelAnalysisPlot(Stoch = F ,print = F,
                                 trace_path = "./Lotka-Volterra_analysis/Lotka-Volterra-analysis-1.trace")

print(AnalysisPlot)
