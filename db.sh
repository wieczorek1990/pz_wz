rake db:drop
sudo -u postgres psql -c 'create database pz_wz_development;'
#sudo -u postgres psql -c 'create database pz_wz_test;'
rake db:migrate
rake db:seed
