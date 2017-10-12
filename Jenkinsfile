#!groovy


node('linux'){
	checkout scm
	stage('Build') {
		docker.image('ruby:2.4.2-stretch').inside{
			sh 'build.sh'
		}
	}
	stage('Test'){
		docker.image('ruby:2.4.2-stretch').inside{
			sh 'rspec Burgertest.rb'
		}
	}
}

//githubNotify description: 'Starting build',  status: 'PENDING'