####
#
#
###

init_generation<-function(x=NULL,min_init , max_init,calib = F)
{
  if(calib){
    # x is the init vector from the calibration_analysis function
    i_1 = x[1]
    i_2 = x[2]
  }else{
       # min/max are vectors = first position interval values for the first place and second position for the second place

   i_1=runif(n=1,min=min_init[1],max=max_init[1])
   i_2=runif(n=1,min=min_init[2],max=max_init[2])
  }


   return( c(i_1,i_2) )
}
msqd<-function(reference, output)
{
  Predator <- output[,"Predator"]
  Prey <- output[,"Prey"]
  
  diff.Predator <- sum(( Predator - reference[,2] )^2 )
  diff.Prey <- sum(( Prey - reference[,1] )^2 )
  
  return(diff.Predator+diff.Prey)
}

Target<-function(output)
{
  ret <- output[,"Predator"]
  return(as.data.frame(ret))
}

# Holling type 2

ParamsFuncResponse<-function(a,h,eps)
{
  return(matrix(c(a,h,eps), ncol = 1))
}

# Holling type 3

ParamsFuncResponseType3<-function(a,h,eps,d,c,b)
{
  return(matrix(c(a,h,eps,d,c,b), ncol = 1))
}
