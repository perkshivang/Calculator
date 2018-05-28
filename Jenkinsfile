pipeline{
	agent any
	environment {
		REPOSITORY_URL = 'git@github.com:perkshivang/Calculator.git'
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
		/* =====NOT REQUIRED===
		stage("Checkout"){
			steps{
				git url: $REPOSITORY_URL
			}
		}
		======================*/

		stage("Code Quality Checks"){
		steps{
		    echo 'code quality checks will be here..'
		}
		}

		stage("Compile"){
		    steps{
		       sh "xcrun xcodebuild -workspace $WORKSPACE_PATH -scheme $SCHEME_NAME archive -archivePath $ARCHIVE_PATH"
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
			sh    '${WORKSPACE}/Pods/Crashlytics/submit $CRASHLYTICS_API_KEY $CRASHLYTICS_BUILD_SECRET \
-ipaPath EXPORT_BUILD_PATH/${SCHEME_NAME}.ipa 
-notesPath ${WORKSPACE}/Notes/ReleaseNotes.txt \
-groupAliases GroupAlias,GroupAlias2 \
-notifications YES'
		}
		}
		
	}
}