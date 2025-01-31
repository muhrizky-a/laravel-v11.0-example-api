node {
    docker.image('composer:2.8.3').inside() {
        stage('Build') { 
            checkout scm
            sh 'composer install'
            sh 'cp .env.example .env'
            sh 'php artisan key:generate'
        }
    }
    docker.image('php:8.4.1-alpine').inside('-p 8009:8009') {
        stage('Post-Build') { 
            sh 'php artisan key:generate'
        }
        // stage('Test') {
            // steps {
                // sh './vendor/bin/phpunit'
            // }
        // }
        stage('Deploy') { 
            sh "chmod +x -R ${env.WORKSPACE}"
            sh './jenkins/scripts/deliver.sh'
            sh 'curl http://localhost:8009'
	        input message: 'Sudah selesai menggunakan Laravel API? (Klik "Proceed" untuk mengakhiri)'
	        sh './jenkins/scripts/kill.sh' 
        }
    }
}
