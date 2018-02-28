# README

* Configurando o novo ambiente 

* Install 

* Vagrant 

* box "bento/ubuntu-16.04" 

* RVM  - curl -sSL https://get.rvm.io | bash -s stable --ruby

* Ruby - rvm install 2.4.3

* Rails -  gem install rails -v 5.0.1

* PG - sudo apt-get install postgresql   
     - sudo apt-get install libpq-dev
     - gem install pg
     - sudo -u postgres psql -c "CREATE USER vagrant WITH SUPERUSER CREATEDB ENCRYPTED PASSWORD 'vagrant'"
     - sudo sed -i "s/port = 5433/port = 5432/" /etc/postgresql/9.3/main/postgresql.conf

* GIT - sudo apt-get install git

      - git config --global user.name "<name>"
      - git config --global user.email "<e-mail>"

* NODEJS - sudo apt-get install nodejs

