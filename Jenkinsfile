pipeline{
	agent any
	environment {
		REPOSITORY_URL = 'git@github.com:perkshivang/Calculator.git'
		WORKSPACE_PATH = 'CalculatorSample/CalculatorSample.xcworkspace'
		SCHEME_NAME = 'CalculatorSample'
		ARCHIVE_PATH = 'Build/CalculatorSample'
		EXPORT_BUILD_PATH = 'Build/'
		EXPORT_OPTIONS_PATH = 'CalculatorSample/ExportOptions.plist'
    	}
	stages{
		/*
		stage("Checkout"){
			steps{
				git url: $REPOSITORY_URL
			}
		}
		*/

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
		    echo 'build has been distributed..'
		}
		}
		
	}
}