How to run the testsuite..

You have 2 options for the purposes of this testsuite.

#############################################################################

1. Docker

### Install

- Install https://docs.docker.com/engine/installation/

### Run
`docker login`

Use my Docker Hub automated build:

`docker pull jobertokotze/robot-docker`

ROBOT_TESTS = path to "jo-todolist-tester.robot"

Mount a directory and pass the ROBOT_TESTS env var:

    docker run --rm \ 
               -e ROBOT_TESTS=/path/to/tests/ \
               -v /path/to/tests/:/path/to/tests/ \
               -ti \
               robot-docker


#############################################################################

2. Create a manual install of RIDE IDE on windows

### Install

Step by Step Installation:

1) Go to https://www.python.org/ and download Python 2.7.x version and install it.

2) Open command prompt and run below command.

`pip install robotframework`

3) Upgrade the pip with below command.

`python -m pip install -U pip`

4) Verifying Installation

After a successful installation, you should be able to execute the created runner scripts with –version option and get both RobotFramework and interpreter versions.

`robot –-version`
 
`rebot --version`

If running the runner scripts fails with a message saying that the command is not found or recognized, a good first step is double-checking the PATH configuration. If that does not help, it is a good idea to re-read relevant sections from these instructions before searching help from the Internet or as asking help on robotframework-users mailing list or elsewhere.
Note: If you have any problem please check Path configuration and restart your PC. Path configuration must be as same as below figure.

`pip install --upgrade robotframework`

Installing RIDE IDE...

1) Python must be installed. Its installation is described in above section.

2) wxPyhton must be installed. On Windows you can download an appropriate installer from wxPython download page and click next > next > next to install package. You need to install “8-win32-unicode-2.8.12.1-py27.exe” 32-bit version.

3) RIDE can be installed with pip using these commands:

`pip install robotframework-ride`

4) After a successful installation, RIDE can be started from the command line by running ride.py. Alternatively, you can specify a file or directory to open as an argument like ride.py path/to/tests.

Installing Selenium 2 (WebDriver) Library
Selenium2Library is a web testing library for Robot Framework that leverages the Selenium 2 (WebDriver) libraries from the Selenium project.

More information about this library can be found on the Wiki and in the Keyword Documentation. Installation information is found in the INSTALL.rst file.
The recommended installation method is using pip.

Installation Command:

`pip install robotframework-selenium2library`

`pip install --upgrade robotframework-selenium2library`

Installing GeckoDriver for Firefox(where tests will execute)...

Navigate to https://github.com/mozilla/geckodriver/releases/tag/v0.18.0.

Download and install https://github.com/mozilla/geckodriver/releases/download/v0.18.0/geckodriver-v0.18.0-win32.zip

Now import my testsuit and run it.

Done.