#runsolver -C 3600 -W 3600 -d 1 -M 32768 
java -Xmx8G -jar plugins/org.eclipse.equinox.launcher_1.3.100.v20150511-1540.jar -data data/ -tc config/AutomizerReach.xml -s config/svcomp-Reach-32bit-Automizer_Bitvector.epf -i main.c --witnessprinter.generate.witnesses false --traceabstraction.compute.hoare.annotation.of.negated.interpolant.automaton false
