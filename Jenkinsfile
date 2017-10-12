#!groovy

//githubNotify description: 'Starting build',  status: 'PENDING'

try {
	stage('Bundle Install'){
		node('linux'){
			docker.image('ruby:2.4.2-stretch').inside{
				sh 'mkdir /source && cd /source'
				checkout scm
				sh 'bundle install'
			}
		}
	}
	stage('Rake'){
		node('linux'){
			docker.image('ruby:2.4.2-stretch').inside{
				sh 'bundle exec rake db:drop db:create db:migrate'
			}
		}
	}
	stage('Test'){
		node('linux'){
			docker.image('ruby:2.4.2-stretch').inside{
				sh 'rspec Burgertest.rb'
			}
		}
	}
	//githubNotify description: 'Completed build',  status: 'SUCCESS'
} catch (Exception e){
	//githubNotify description: 'Error with build',  status: 'ERROR'
}