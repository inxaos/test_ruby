#!groovy


node('linux'){
	checkout scm
	stage('Build') {
		docker.image('ruby:2.4.2-stretch').inside{
			apt-get update && apt-get install -y nano nodejs
			bundle install
			bundle exec rake db:drop db:create db:migrate
		}
	}
	stage('Test'){
		docker.image('ruby:2.4.2-stretch').inside{
			rspec Burgertest.rb
		}
	}
}

//githubNotify description: 'Starting build',  status: 'PENDING'