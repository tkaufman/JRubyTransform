BASE=/Users/toddkaufman/Projects/JRubyTransform/legacy-java/target/org.springframework.samples.petclinic-1.0.0-SNAPSHOT/WEB-INF
CLASSPATH=$BASE/classes:$BASE/../test-classes:$BASE/classes/SimpleJdbcClinicTests-context.xml:$BASE/lib/*
export CLASSPATH
jruby -S cucumber $1
