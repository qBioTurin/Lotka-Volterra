library(epimod)

downloadContainers()

setwd("./Net") 

# Holling Type 2 simulation

# General Function for holling type 2

model.generation(net_fname = "Lotka-Volterra-General-Type2.PNPRO", 
                 transitions_fname = "../Cpp/transitions_holling_type2.cpp")

setwd("..")

# Sensitivity Analysis check holling type 2

sensitivity<-model.sensitivity(n_config = 30,
                               parameters_fname = "Input/Functions_list_FNgeneral_type2.csv",
                               functions_fname = "Rfunction/Functions.R",
                               solver_fname = "Net/Lotka-Volterra-General-Type2.solver",
                               reference_data = "Input/reference_data.csv",
                               distance_measure = "msqd" ,
                               target_value  = "Target" ,
                               parallel_processors = 2,
                               f_time = 20,
                               s_time = .1)

# Model Calibration check holling type 2

model.calibration(solver_fname = "Net/Lotka-Volterra-General-Type2.solver",
                  parameters_fname = "Input/Functions_list_FNgeneral_type2.csv",
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

# Model Analysis check holling type 2

model.analysis(solver_fname = "Net/Lotka-Volterra-General-Type2.solver",
               functions_fname = "Rfunction/Functions.R",
               parameters_fname = "Input/Functions_list_FNgeneral_type2.csv",
               f_time = 50,
               s_time = .5
)

# Analysis Plot for General Function

source("Rfunction/ModelAnalysisPlot.R")

AnalysisPlot = ModelAnalysisPlot(Stoch = F ,print = F,
                                 trace_path = "./Lotka-Volterra-General-Type2_analysis/Lotka-Volterra-General-Type2-analysis-1.trace")

print(AnalysisPlot)

# Holling Type 3 simulation

setwd("./Net") 

# General Function for holling type 3

model.generation(net_fname = "Lotka-Volterra-General-Type3.PNPRO", 
                 transitions_fname = "../Cpp/transitions_holling_type3.cpp")


setwd("..")

# Sensitivity Analysis check holling type 3

sensitivity<-model.sensitivity(n_config = 30,
                               parameters_fname = "Input/Functions_list_FNgeneral_type3.csv",
                               functions_fname = "Rfunction/Functions.R",
                               solver_fname = "Net/Lotka-Volterra-General-Type3.solver",
                               reference_data = "Input/reference_data.csv",
                               distance_measure = "msqd" ,
                               target_value  = "Target" ,
                               parallel_processors = 2,
                               f_time = 20,
                               s_time = .1)

# Model Calibration check holling type 3

model.calibration(solver_fname = "Net/Lotka-Volterra-General-Type3.solver",
                  parameters_fname = "Input/Functions_list_FNgeneral_type3.csv",
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

# Model Analysis check holling type 3

model.analysis(solver_fname = "Net/Lotka-Volterra-General-Type3.solver",
               functions_fname = "Rfunction/Functions.R",
               parameters_fname = "Input/Functions_list_FNgeneral_type3.csv",
               f_time = 50,
               s_time = .5
)

source("Rfunction/ModelAnalysisPlot.R")

AnalysisPlot = ModelAnalysisPlot(Stoch = F ,print = F,
                                 trace_path = "./Lotka-Volterra-General-Type3_analysis/Lotka-Volterra-General-Type3-analysis-1.trace")

print(AnalysisPlot)
