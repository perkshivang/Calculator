pipeline{
	agent any
	stages{
		stage("Checkout"){
			steps{
				git url: 'git@github.com:perkshivang/Calculator.git'
			}
		}
		stage("Code Quality Checks"){
		steps{
		    echo 'code quality checks will be here..'
		}
		}

		stage("Compile"){
		    steps{
		       sh "xcrun xcodebuild -project 'CalculatorSample/CalculatorSample.xcodeproj' -scheme 'CalculatorSample' archive -archivePath 'Build/CalculatorSample'"
		    }
		}
		stage("Unit Test"){
		steps{
		    echo 'unit test will be here..'
		}
		}

		stage("Export Archieve"){
		    steps{
		        sh "xcodebuild -exportArchive -archivePath 'Build/CalculatorSample.xcarchive' -exportPath 'Build/' -exportOptionsPlist 'CalculatorSample/ExportOptions.plist'"  
		    }
		}
	}
}