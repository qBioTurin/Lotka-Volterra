double BirthPredatorFunction(double *Value,
                         map <string,int>& NumTrans,
                         map <string,int>& NumPlaces,
                         const vector<string> & NameTrans,
                         const struct InfTr* Trans,
                         const int T,
                         const double& time,
                         const double a,
                         const double h,
                         const double eps)
{

    int idxPrey = NumPlaces.find("Prey") -> second ;
    int idxPredator = NumPlaces.find("Predator") -> second ;
    
    double Predator = Value[idxPredator];
    double Prey = Value[idxPrey];

    double rate = eps * (a * Prey) / (1+ a * h * Prey) * Predator;

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
                         const double eps)
{
    
    int idxPrey = NumPlaces.find("Prey") -> second ;
    int idxPredator = NumPlaces.find("Predator") -> second ;
    
    double Predator = Value[idxPredator];
    double Prey = Value[idxPrey];

    double rate = (a * Prey) / (1+ a * h * Prey) * Predator;

    return(rate);
}
