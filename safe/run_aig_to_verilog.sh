#$MYDIR="/users/rajdeep/hw-acdcl/hwmcc15-benchmarks-single/"
#DIRS=`ls -l $MYDIR | egrep '^d' | awk '{print $9}'`
TOOL=ba2ver
BENCHMARKLIST=`cat benchmarks.txt`
PWD=`pwd`
PROGRESSLOG=${PWD}/progress.log-${TOOL}
FLAGS=""
EXEC=/users/rajdeep/blif_aig_to_verilog/ba2ver
echo "Starting experiments at `date` on `hostname`" > ${PROGRESSLOG}
for FILE in $BENCHMARKLIST
do
  #echo  ${FILE}
  #cd ${DIR}
  filename=${FILE}
  file=$(echo $FILE | cut -d'.' -f 1)
  mkdir ${file}
  cp ${filename} ${file}/
  cd ${file}
  file+=".sv"
  #echo "Starting to processing $filename at `date`" >> ${PROGRESSLOG}
  ${EXEC} ${FLAGS} $filename $file 
  OUT=$?
  if [ $OUT -eq 124 ];then
   echo "Command timeout" 
  else
   echo "Output file name $file"
  fi
  echo "done at `date`"
  cd ../
done
