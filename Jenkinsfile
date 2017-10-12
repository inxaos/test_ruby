#!groovy


node('linux'){
	checkout scm
	stage('Build') {
		docker.image('ruby:2.4.2-stretch').inside{
			sh 'bundle install'
			sh 'bundle exec rake db:drop db:create db:migrate'
		}
	}
	stage('Test'){
		docker.image('ruby:2.4.2-stretch').inside{
			sh 'rspec Burgertest.rb'
		}
	}
}

//githubNotify description: 'Starting build',  status: 'PENDING'