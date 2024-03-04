double BirthPredatorFunction(double *Value,
                         map <string,int>& NumTrans,
                         map <string,int>& NumPlaces,
                         const vector<string> & NameTrans,
                         const struct InfTr* Trans,
                         const int T,
                         const double& time,
                         const double a,
                         const double h,
                         const double eps,
                         const double d,
                         const double c,
                         const double b)
{
         
    int idxPrey = NumPlaces.find("Prey") -> second ;
    int idxPredator = NumPlaces.find("Predator") -> second ;
    
    double Predator = Value[idxPredator];
    double Prey = Value[idxPrey];
		
		double g_holling_type3 = ((d * Prey + b * (Prey*Prey)) / (1 + (c * Prey) + (d * h * Prey) + (b * h * (Prey * Prey))));
    double rate = eps * g_holling_type3;

    return(rate);
}

double DeathPreyFunction(double *Value,
                         map <string,int>& NumTrans,
                         map <string,int>& NumPlaces,
                         const vector<string> & NameTrans,
                         const struct InfTr* Trans,
                         const int T,
                         const double& time,
                         const double a,
                         const double h,
                         const double eps,
                         const double d,
                         const double c,
                         const double b)
{
         
    int idxPrey = NumPlaces.find("Prey") -> second ;
    int idxPredator = NumPlaces.find("Predator") -> second ;
    
    double Predator = Value[idxPredator];
    double Prey = Value[idxPrey];

    double rate = ((d * Prey + b * (Prey*Prey)) / (1 + (c * Prey) + (d * h * Prey) + (b * h * (Prey * Prey))));

    return(rate);
}
