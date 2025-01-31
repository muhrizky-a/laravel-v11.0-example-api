node {
    docker.image('php:8.4.1-alpine').inside('-p 8009:8009') {
        stage('Build') { 
            checkout scm
	        sh 'composer install' 
        }
        stage('Test') { 
            //sh './jenkins/scripts/test.sh'
        }
        stage('Deploy') { 
            sh './jenkins/scripts/deliver.sh'
	        input message: 'Sudah selesai menggunakan Laravel API? (Klik "Proceed" untuk mengakhiri)'
	        sh './jenkins/scripts/kill.sh' 
        }
    }
}
