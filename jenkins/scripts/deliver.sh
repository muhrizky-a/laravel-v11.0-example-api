#!/usr/bin/env sh
echo 'The following "npm" command runs your Node.js/React application in'
echo 'development mode and makes the application available for web browsing.'
echo 'The "npm start" command has a trailing ampersand so that the command runs'
echo 'as a background process (i.e. asynchronously). Otherwise, this command'
echo 'can pause running builds of CI/CD applications indefinitely. "npm start"'
echo 'is followed by another command that retrieves the process ID (PID) value'
echo 'of the previously run process (i.e. "npm start") and writes this value to'
echo 'the file ".pidfile".'
set -x
php artisan serve --host 0.0.0.0 --port 8009 &
sleep 10
echo $! > .pidfile
set +x

echo 'Now...'
echo 'Visit http://localhost:8009 to see your Laravel application in action.'
echo '(This is why you specified the "args ''-p 8009:8009''" parameter when you'
echo 'created your initial Pipeline as a Jenkinsfile.)'