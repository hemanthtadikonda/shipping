node {
   properties([
      parameters([
         [$class: 'PasswordParameterDefinition',
          name: 'SONAR PASSWORD',
          description: "Enter Sonar password"
         ],
         [$class: 'PasswordParameterDefinition',
          name: 'NEXUS USERNAME',
          defaultValue: 'admin'
          description: "Enter Nexus Username"
         ],
         [$class: 'PasswordParameterDefinition',
          name: 'NEXUS PASSWORD',
          description: "Enter Nexus password"
         ],
      ]),
   ])

   stage('compile') {
      //sh '/home/centos/maven/bin/mvn package'
      sh "echo ${params.SONAR PASSWORD}"
      print 'ok'
   }

   if( env.BRANCH_NAME ==~ ".*" && env.TAG_NAME == null ) {
      stage('test cases') {
         //sh '/home/centos/maven/bin/mvn test'
         sh "echo ${params.NEXUS PASSWORD}"
         print 'read pass'
      }
   }
   if( env.BRANCH_NAME == "main" && env.TAG_NAME == null ) {
      stage('code Quality'){
         env.SONARPASS = "${params.SONAR PASSWORD}"
         wrap([$class: 'MaskPasswordsBuildWrapper', varPasswordPairs: [[password: 'SONARPASS']]]) {
            sh 'echo ${SONARPASS}'
          //sh 'sonar-scanner -Dsonar.host.url=http://172.31.89.117:9000 -Dsonar.login=admin -Dsonar.password=${SONARPASS} -Dsonar.projectKey=shipping -Dsonar.qualitygate.wait=true -Dsonar.java.binaries=./target'
         }
      }
   }
   if( env.BRANCH_NAME == "main" && env.TAG_NAME == null ) {
      stage('code security'){
         //sh 'IN code security we will generally used SAST & SCA checks'
         print 'code security'
      }
   }
   if( env.TAG_NAME ==~ ".*" ) {
      stage('App Release') {
         env.nexususer = "${params.NEXUS USERNAME}"
         env.nexuspass = "${params.NEXUS PASSWORD}"
         wrap([$class: 'MaskPasswordsBuildWrapper', varPasswordPairs: [[password: 'nexuspass']]]) {
            //sh 'cp target/shipping-1.0.jar shipping.jar; zip -r shipping-${TAG_NAME}.zip shipping.jar VERSION ${schemadir}'
            //sh 'curl -v -u ${nexususer}:${nexuspass} --upload-file shipping-${TAG_NAME}.zip http://172.31.24.24:8081/repository/shipping/shipping-${TAG_NAME}.zip'
            sh 'echo ${nexuspass}'
            sh 'echo ${nexususer}'
         }
      }
   }
}

