export timestamp=$(date +%Y%m%d_%H%M%S) && \

# provide volume_path from host:
export volume_path=/home/tester/Desktop/Personal_Gitlab/api-performance-testing/microservice-1 && \

export jmeter_path=/mnt/jmeter && \

# default user name
username=default_user

# get password from tester
read -s -p "Enter Password for $username: " password

docker run \
  --volume ${volume_path}:${jmeter_path} \
  jmeter \
  -n  \
  -Jusername=${username} \
  -Jpassword=${password} \
  -Jvariables_from_csv_file=${jmeter_path}/udv.csv \
  -Jerror_log_file=${jmeter_path}/reports/Failed_sessions_response_data_${timestamp}.xml \
  -t ${jmeter_path}/scripts/api_load_test.jmx \
  -l ${jmeter_path}/reports/result_${timestamp}.jtl \
  -e \
  -o ${jmeter_path}/reports/html_${timestamp} \
  -j ${jmeter_path}/reports/jmeter_${timestamp}.log 

