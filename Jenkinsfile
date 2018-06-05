pipeline{

	agent { node { label 'node1' } }	

	environment {
		REPOSITORY_URL = 'https://github.com/perkshivang/Calculator'
		WORKSPACE_PATH = 'CalculatorSample/CalculatorSample.xcworkspace'
		SCHEME_NAME = 'CalculatorSample'
		ARCHIVE_PATH = 'Build/CalculatorSample'
		EXPORT_BUILD_PATH = 'Build/'
		EXPORT_OPTIONS_PATH = 'CalculatorSample/ExportOptions.plist'
		PATH_TO_CRASHLYTICS_FRAMEWORK = ''
		CRASHLYTICS_API_KEY = '7046a2db871ccf3d313cdfb7a582229887fde528'
		CRASHLYTICS_BUILD_SECRET= 'f7a06edfc22f80b16c13ed947758ae06a8d0cc7c0d6000f360dbc352bcd9e327'
		RELEASE_NOTES_PATH = ''
		IPA_PATH = ''
    	}
	stages{
		// =====NOT REQUIRED===
		stage('Unlock keychain'){
		    steps{
		        sh 'security unlock-keychain -p "jenkins" ${HOME}/Library/Keychains/login_renamed_1.keychain'

                //sh 'security set-keychain-settings -t 3600 -l ${HOME}/Library/Keychains/login.keychain'
		    }
		}
		stage("Checkout"){
			steps{
checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CleanBeforeCheckout']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '92f63fc5-ea70-4e81-b790-3c100613e3a1', url: 'https://github.com/perkshivang/Calculator']]])
			    
			}
		}
//======================*/
       
		stage("Code Quality Checks"){
			steps{
		    		echo 'code quality checks will be here..'
			}
		}

		stage("Compile"){
		    steps{
		       sh 'xcrun xcodebuild -workspace $WORKSPACE_PATH -scheme $SCHEME_NAME archive -archivePath $ARCHIVE_PATH'
		       echo'compile succeed'
		    }
		}
		stage("Unit Test"){
			steps{
		    		echo 'unit test will be here..'
			}
		}
        
		stage("Export Archieve"){
		    steps{
		        sh "xcodebuild -exportArchive -archivePath 'Build/CalculatorSample.xcarchive' -exportPath $EXPORT_BUILD_PATH -exportOptionsPlist $EXPORT_OPTIONS_PATH"  
		    }
		}
		stage("Distribute Build"){
			steps{
				sh    '${WORKSPACE}/${SCHEME_NAME}/Pods/Crashlytics/submit $CRASHLYTICS_API_KEY $CRASHLYTICS_BUILD_SECRET \
-ipaPath $EXPORT_BUILD_PATH/CalculatorSample.ipa -notesPath ${WORKSPACE}/ReleaseNotes.txt  -groupAliases ios-developers  -notifications YES'
			}
		}
	
	}
}