node {
    docker.image('php:8.4.1-alpine').inside('-p 8009:8009') {
        stage('Build') { 
            checkout scm
            docker.image('composer:2.8.3').inside() {
                sh 'composer install'
            }
        }
        stage('Deploy') { 
            sh './jenkins/scripts/deliver.sh'
	        input message: 'Sudah selesai menggunakan Laravel API? (Klik "Proceed" untuk mengakhiri)'
	        sh './jenkins/scripts/kill.sh' 
        }
    }
}
