# testing what we just built

if("d" IN_LIST arith)
  add_executable(mumpscfg test_mumps.f90)
  target_link_libraries(mumpscfg PRIVATE dmumps MUMPS::MUMPS ${NUMERIC_LIBS})

  if(parallel)
    add_test(NAME mumps:config COMMAND ${MPIEXEC_EXECUTABLE} ${MPIEXEC_NUMPROC_FLAG} 2 $<TARGET_FILE:mumpscfg>)
  else()
    add_test(NAME mumps:config COMMAND $<TARGET_FILE:mumpscfg>)
  endif()
  set_tests_properties(mumps:config PROPERTIES RESOURCE_LOCK cpu_mpi)
endif()

if("s" IN_LIST arith)
  add_executable(s_simple s_simple.f90)
  target_link_libraries(s_simple PRIVATE smumps MUMPS::MUMPS ${NUMERIC_LIBS})

  if(parallel)
    add_test(NAME mumps:simpleReal32 COMMAND ${MPIEXEC_EXECUTABLE} ${MPIEXEC_NUMPROC_FLAG} 2 $<TARGET_FILE:s_simple>)
  else()
    add_test(NAME mumps:simpleReal32 COMMAND $<TARGET_FILE:s_simple>)
  endif()
  set_tests_properties(mumps:simpleReal32 PROPERTIES RESOURCE_LOCK cpu_mpi)
endif()

if("d" IN_LIST arith)
  add_executable(d_simple d_simple.f90)
  target_link_libraries(d_simple PRIVATE dmumps MUMPS::MUMPS ${NUMERIC_LIBS})

  if(parallel)
    add_test(NAME mumps:simpleReal64 COMMAND ${MPIEXEC_EXECUTABLE} ${MPIEXEC_NUMPROC_FLAG} 2 $<TARGET_FILE:d_simple>)
  else()
    add_test(NAME mumps:simpleReal64 COMMAND $<TARGET_FILE:d_simple>)
  endif()
  set_tests_properties(mumps:simpleReal64 PROPERTIES RESOURCE_LOCK cpu_mpi)

  if(NOT ClangTest)
    return()
  endif()

  add_executable(Csimple simple.c)
  target_link_libraries(Csimple PRIVATE dmumps MUMPS::MUMPS ${NUMERIC_LIBS})

  if(parallel)
    add_test(NAME mumps:CsimpleReal64 COMMAND ${MPIEXEC_EXECUTABLE} ${MPIEXEC_NUMPROC_FLAG} 2 $<TARGET_FILE:Csimple>)
  else()
    add_test(NAME mumps:CsimpleReal64 COMMAND $<TARGET_FILE:Csimple>)
  endif()
  set_tests_properties(mumps:CsimpleReal64 PROPERTIES RESOURCE_LOCK cpu_mpi)
endif()
