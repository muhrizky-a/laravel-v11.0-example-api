node {
    docker.image('php:8.4.1-alpine').inside('-p 8009:8009') {
        stage('Build') { 
            checkout scm
	        sh 'composer install' 
        }
        stage('Test') { 
            #sh './jenkins/scripts/test.sh'
        }
        stage('Deploy') { 
            set -x
            php artisan serve --host 0.0.0.0 --port 8009 &
            sleep 1
            echo $! > .pidfile
            set +x

            echo 'Now...'
            echo 'Visit http://localhost:3000 to see your Laravel application in action.'
            echo '(This is why you specified the "args -p 8009:8009 parameter when you'
            echo 'created your initial Pipeline as a Jenkinsfile.)'
        }
    }
}
