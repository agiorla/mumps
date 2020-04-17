/*
 *
 *  This file is part of MUMPS 5.3.1, released
 *  on Fri Apr 10 13:52:30 UTC 2020
 *
 *
 *  Copyright 1991-2020 CERFACS, CNRS, ENS Lyon, INP Toulouse, Inria,
 *  Mumps Technologies, University of Bordeaux.
 *
 *  This version of MUMPS is provided to you free of charge. It is
 *  released under the CeCILL-C license:
 *  http://www.cecill.info/licences/Licence_CeCILL-C_V1-en.html
 *
 */
#include<stdio.h>
int main()
{
printf("#if ! defined(MUMPS_INT_H)\n");
printf("#   define MUMPS_INT_H\n");
#if defined(INTSIZE64)
printf("#   define MUMPS_INTSIZE64\n");
#else
printf("#   define MUMPS_INTSIZE32\n");
#endif
printf("#endif\n");
return 0;
}
