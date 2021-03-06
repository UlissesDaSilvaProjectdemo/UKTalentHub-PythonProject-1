echo "Setting up a virtual environment.."
python -m venv venv

echo "Activating the virtual environment.."
# try to set up on a mac or linux
source venv/bin/activate
# try to set up on windows
. venv/Scripts/activate

echo "Installing 3rd party dependencies.."
pip install --upgrade pip
pip install -r requirements.txt

echo "Setting up the board using the Trello API.."
rem pytest -s -v testCases/TC004_RestAPI.py

echo "Running the pytest solution.."
rem pytest -s -v  --html=.Reports/report.html testCases/TC001_LoginTest.py --browser chrome
rem pytest -s -v  --html=.Reports/report.html testCases/TC002_LinksSmokeTest.py --browser chrome
rempytest -s -v  --html=.Reports/report.html testCases/TC003_ImgsSmokeTest.py --browser chrome#
rem pytest -s -v  --html=.Reports/report.html testCases/TC004_RestAPI.py --browser chrome

echo "Running the BDD tests.."
behave testCases/features/TC001_loginNegativePath.feature
behave testCases/feature/TC002_trello_automation.feature
behave testCases/selenium/TC001_selecct_dropdown.feature
behave testCases/selenium/TC002_clickSendKeys.feature
behave testCases/selenium/TC003_RadioButtonsAndCheckboxes.feature
behave testCases/selenium/TC004_drag_and_drop.feature
behave testCases/selenium/TC005_mouse_hovering.feature
behave testCases/selenium/TC006_switch_to_alert.feature
behave testCases/selenium/TC007_switch_to_frame.feature
behave testCases/selenium/TC008_switch_to_window.feature
behave testCases/selenium/TC008_switch_to_window.feature
behave testCases/selenium/TC010_scrolling_element.feature
 





