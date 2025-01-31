node {
    docker.image('composer:2.8.3').inside() {
        stage('Build') { 
            checkout scm
            sh 'composer install'
        }
    }
    docker.image('php:8.4.1-alpine').inside('-p 8009:8009') {
        stage('Deploy') { 
            sh "chmod +x -R ${env.WORKSPACE}"
            sh './jenkins/scripts/deliver.sh'
	        input message: 'Sudah selesai menggunakan Laravel API? (Klik "Proceed" untuk mengakhiri)'
	        sh './jenkins/scripts/kill.sh' 
        }
    }
}
